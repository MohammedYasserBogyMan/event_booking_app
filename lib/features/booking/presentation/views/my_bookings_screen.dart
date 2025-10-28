import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/core/models/booking_model.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo.dart';
import 'package:event_booking_app/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:event_booking_app/features/booking/presentation/cubit/booking_state.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
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
      backgroundColor: AppColor.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColor.lightBackground,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Bookings',
          style: Styels.textStyleMedium24,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is BookingCancelled) {
            showSnackBar(context, message: 'Booking cancelled successfully');
            _loadBookings();
          } else if (state is BookingError) {
            showSnackBar(context, message: state.message);
          }
        },
        builder: (context, state) {
          if (state is BookingLoading && state is! BookingsLoaded) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
                strokeWidth: 3,
              ),
            );
          }

          if (state is BookingsLoaded) {
            if (state.bookings.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: AppColor.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.event_busy,
                        size: 80,
                        color: AppColor.primary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'No bookings yet',
                      style: Styels.textStyleMedium22.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Start booking events to see them here',
                      style: Styels.textStyleRegular16.copyWith(
                        color: AppColor.lightgray,
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
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: AppColor.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.event_note,
                    size: 80,
                    color: AppColor.primary,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Load your bookings',
                  style: Styels.textStyleMedium22.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _loadBookings,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Refresh',
                    style: Styels.textStyleMedium16.copyWith(
                      color: Colors.white,
                    ),
                  ),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Cancel Booking',
          style: Styels.textStyleMedium20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Are you sure you want to cancel this booking? This action cannot be undone.',
          style: Styels.textStyleRegular16.copyWith(
            color: AppColor.lightgray,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              'Keep Booking',
              style: Styels.textStyleMedium16.copyWith(
                color: AppColor.lightgray,
              ),
            ),
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
              backgroundColor: AppColor.errorColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Cancel Booking',
              style: Styels.textStyleMedium16.copyWith(
                color: Colors.white,
              ),
            ),
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
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(60),
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColor.primary,
                  strokeWidth: 3,
                ),
              ),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox.shrink();
        }

        final event = snapshot.data!;

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            onTap: () {
              // Navigate to event details
              context.push('/event-details', extra: event);
            },
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          event.imageUrl,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color: AppColor.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.event,
                              color: AppColor.primary,
                              size: 40,
                            ),
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
                              style: Styels.textStyleMedium18.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: AppColor.lightgray,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    event.location,
                                    style: Styels.textStyleRegular14.copyWith(
                                      color: AppColor.lightgray,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                  color: AppColor.lightgray,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${event.date.day}/${event.date.month}/${event.date.year}',
                                  style: Styels.textStyleRegular14.copyWith(
                                    color: AppColor.lightgray,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _buildStatusChip(booking.status),
                    ],
                  ),
                  const Divider(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ticket Number',
                            style: Styels.textStyleRegular12.copyWith(
                              color: AppColor.lightgray,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            booking.ticketNumber,
                            style: Styels.textStyleMedium16.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Price',
                            style: Styels.textStyleRegular12.copyWith(
                              color: AppColor.lightgray,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${booking.price}',
                            style: Styels.textStyleBold18.copyWith(
                              color: AppColor.primary,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (booking.status == BookingStatus.confirmed) ...[
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        onPressed: onCancel,
                        icon: const Icon(Icons.cancel_outlined, size: 20),
                        label: Text(
                          'Cancel Booking',
                          style: Styels.textStyleMedium16,
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColor.errorColor,
                          side: BorderSide(
                            color: AppColor.errorColor,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
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
        backgroundColor = const Color(0xFF34C759); // Green
        textColor = Colors.white;
        label = 'Confirmed';
        break;
      case BookingStatus.cancelled:
        backgroundColor = AppColor.errorColor;
        textColor = Colors.white;
        label = 'Cancelled';
        break;
      case BookingStatus.completed:
        backgroundColor = AppColor.primary;
        textColor = Colors.white;
        label = 'Completed';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: Styels.textStyleRegular12.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
