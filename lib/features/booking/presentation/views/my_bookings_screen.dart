import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/core/models/booking_model.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo.dart';
import 'package:event_booking_app/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:event_booking_app/features/booking/presentation/cubit/booking_state.dart';
import 'package:go_router/go_router.dart';
import 'package:event_booking_app/core/di/service_locator.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  void initState() {
    super.initState();
    _loadBookings();
  }

  void _loadBookings() {
    final currentUserState = context.read<CurrentUserCubit>().state;
    if (currentUserState is CurrentUserSuccess) {
      context.read<BookingCubit>().getUserBookings(
            userId: currentUserState.user.uid,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
      ),
      body: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is BookingCancelled) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Booking cancelled successfully'),
                backgroundColor: Colors.green,
              ),
            );
            _loadBookings();
          } else if (state is BookingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is BookingLoading && state is! BookingsLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is BookingsLoaded) {
            if (state.bookings.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.event_busy,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No bookings yet',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Start booking events to see them here',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[500],
                          ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                _loadBookings();
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.bookings.length,
                itemBuilder: (context, index) {
                  final booking = state.bookings[index];
                  return _BookingCard(
                    booking: booking,
                    eventRepo: getIt<EventsRepo>(),
                    onCancel: () => _showCancelDialog(booking),
                  );
                },
              ),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.event_note,
                  size: 80,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'Load your bookings',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loadBookings,
                  child: const Text('Refresh'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showCancelDialog(BookingModel booking) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Cancel Booking'),
        content: const Text(
          'Are you sure you want to cancel this booking? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Keep Booking'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              final currentUserState = context.read<CurrentUserCubit>().state;
              if (currentUserState is CurrentUserSuccess) {
                context.read<BookingCubit>().cancelBooking(
                      bookingId: booking.id,
                      eventId: booking.eventId,
                      userId: currentUserState.user.uid,
                    );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Cancel Booking'),
          ),
        ],
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final BookingModel booking;
  final EventsRepo eventRepo;
  final VoidCallback onCancel;

  const _BookingCard({
    required this.booking,
    required this.eventRepo,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EventModel?>(
      future: _getEventDetails(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox.shrink();
        }

        final event = snapshot.data!;

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          child: InkWell(
            onTap: () {
              // Navigate to event details
              context.push('/event-details', extra: event);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          event.imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 80,
                            height: 80,
                            color: Colors.grey[300],
                            child: const Icon(Icons.event),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 14, color: Colors.grey[600]),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    event.location,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.grey[600]),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.calendar_today,
                                    size: 14, color: Colors.grey[600]),
                                const SizedBox(width: 4),
                                Text(
                                  '${event.date.day}/${event.date.month}/${event.date.year}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _buildStatusChip(booking.status),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ticket Number',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            booking.ticketNumber,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Price',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '\$${booking.price}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (booking.status == BookingStatus.confirmed) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: onCancel,
                        icon: const Icon(Icons.cancel_outlined),
                        label: const Text('Cancel Booking'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<EventModel?> _getEventDetails(BuildContext context) async {
    final result = await eventRepo.getEventById(booking.eventId);

    return result.fold(
      (failure) => null,
      (event) => event,
    );
  }

  Widget _buildStatusChip(BookingStatus status) {
    Color backgroundColor;
    Color textColor;
    String label;

    switch (status) {
      case BookingStatus.confirmed:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        label = 'Confirmed';
        break;
      case BookingStatus.cancelled:
        backgroundColor = Colors.red;
        textColor = Colors.white;
        label = 'Cancelled';
        break;
      case BookingStatus.completed:
        backgroundColor = Colors.blue;
        textColor = Colors.white;
        label = 'Completed';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
