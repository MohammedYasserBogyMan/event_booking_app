import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:event_booking_app/features/booking/presentation/cubit/booking_state.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatefulWidget {
  final EventModel event;

  const PaymentScreen({super.key, required this.event});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = 'credit_card';
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColor.lightBackground,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Payment',
          style: Styels.textStyleMedium24,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocListener<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is BookingSuccess) {
            showSuccessSnackBar(
              context,
              message: 'Booking confirmed - Ticket: ${state.booking.ticketNumber}',
            );
            // Navigate back twice to return to event details
            context.pop();
            context.pop();
          } else if (state is BookingError) {
            showErrorSnackBar(context, message: state.message);
            setState(() {
              isProcessing = false;
            });
          }
        },
        child: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            if (state is BookingLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.primary,
                  strokeWidth: 3,
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Summary Card
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Event Summary',
                            style: Styels.textStyleMedium20.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  widget.event.imageUrl,
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
                                      widget.event.title,
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
                                            widget.event.location,
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
                                          '${widget.event.date.day}/${widget.event.date.month}/${widget.event.date.year}',
                                          style: Styels.textStyleRegular14.copyWith(
                                            color: AppColor.lightgray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Price:',
                                style: Styels.textStyleMedium16.copyWith(
                                  color: AppColor.lightgray,
                                ),
                              ),
                              Text(
                                '\$${widget.event.price}',
                                style: Styels.textStyleBold18.copyWith(
                                  color: AppColor.primary,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Payment Method
                  Text(
                    'Payment Method',
                    style: Styels.textStyleMedium20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildPaymentOption(
                    icon: Icons.credit_card,
                    title: 'Credit Card',
                    subtitle: 'Pay with Visa, Mastercard',
                    value: 'credit_card',
                  ),
                  const SizedBox(height: 8),
                  _buildPaymentOption(
                    icon: Icons.account_balance_wallet,
                    title: 'Digital Wallet',
                    subtitle: 'Apple Pay, Google Pay',
                    value: 'wallet',
                  ),
                  const SizedBox(height: 8),
                  _buildPaymentOption(
                    icon: Icons.account_balance,
                    title: 'Bank Transfer',
                    subtitle: 'Direct bank transfer',
                    value: 'bank',
                  ),

                  const SizedBox(height: 24),

                  // Payment Form (Simple UI - Not Functional)
                  if (selectedPaymentMethod == 'credit_card') ...[
                    Text(
                      'Card Details',
                      style: Styels.textStyleMedium18.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Card Number',
                        labelStyle: Styels.textStyleRegular14,
                        hintText: '1234 5678 9012 3456',
                        hintStyle: Styels.textStyleRegular14.copyWith(
                          color: AppColor.lightgray,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColor.lightgray),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColor.lightgray),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColor.primary, width: 2),
                        ),
                        prefixIcon: Icon(Icons.credit_card, color: AppColor.primary),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Expiry Date',
                              labelStyle: Styels.textStyleRegular14,
                              hintText: 'MM/YY',
                              hintStyle: Styels.textStyleRegular14.copyWith(
                                color: AppColor.lightgray,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: AppColor.lightgray),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: AppColor.lightgray),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: AppColor.primary, width: 2),
                              ),
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'CVV',
                              labelStyle: Styels.textStyleRegular14,
                              hintText: '123',
                              hintStyle: Styels.textStyleRegular14.copyWith(
                                color: AppColor.lightgray,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: AppColor.lightgray),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: AppColor.lightgray),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: AppColor.primary, width: 2),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 32),

                  // Confirm Payment Button
                  isProcessing
                      ? Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColor.primary.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : CustomButton(
                          text: 'PAY - \$${widget.event.price}',
                          onPressed: _handlePayment,
                        ),

                  const SizedBox(height: 16),

                  // Security Note
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColor.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColor.primary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.lock, color: AppColor.primary, size: 24),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Your payment is secure and encrypted',
                            style: Styels.textStyleRegular14.copyWith(
                              color: AppColor.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required String value,
  }) {
    final isSelected = selectedPaymentMethod == value;

    return InkWell(
      onTap: () {
        setState(() {
          selectedPaymentMethod = value;
        });
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColor.primary : AppColor.lightgray,
            width: isSelected ? 2.5 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? AppColor.primary.withValues(alpha: 0.08)
              : Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColor.primary.withValues(alpha: 0.15)
                    : AppColor.lightgray.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColor.primary : AppColor.lightgray,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styels.textStyleMedium16.copyWith(
                      color: isSelected ? AppColor.primary : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Styels.textStyleRegular12.copyWith(
                      color: AppColor.lightgray,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _handlePayment() async {
    setState(() {
      isProcessing = true;
    });

    // Get current user
    final currentUserState = context.read<CurrentUserCubit>().state;
    if (currentUserState is! CurrentUserSuccess) {
      showErrorSnackBar(context, message: 'Please login to continue');
      setState(() {
        isProcessing = false;
      });
      return;
    }

    final userId = currentUserState.user.uid;

    // Simulate payment processing delay
    await Future.delayed(const Duration(seconds: 2));

    // Create booking
    if (mounted) {
      context.read<BookingCubit>().bookEvent(
            userId: userId,
            eventId: widget.event.id,
            price: widget.event.price,
          );
    }
  }
}
