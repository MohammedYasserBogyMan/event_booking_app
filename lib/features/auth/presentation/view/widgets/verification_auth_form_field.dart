import 'package:event_booking_app/core/di/service_locator.dart';
import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/features/auth/presentation/manager/email_verification_cubit/email_verification_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/email_verification_cubit/email_verification_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificarionAuthFormFields extends StatefulWidget {
  const VerificarionAuthFormFields({super.key, required this.userModel});
  final UserModel userModel;
  @override
  State<VerificarionAuthFormFields> createState() =>
      _VerificarionAuthFormFieldsState();
}

class _VerificarionAuthFormFieldsState
    extends State<VerificarionAuthFormFields> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EmailVerificationCubit>(),
      child: BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
        listener: (context, state) {
          if (state is SuccessEmailVerificationState) {
            showSuccessSnackBar(context, message: "Email verified successfully!");
            goToNewScreen(
              context,
              locationOfNewScreen: AppRouter.kEditProfileView,
              extra: widget.userModel,
            );
          } else if (state is FailureEmailVerificationState) {
            showErrorSnackBar(context, message: state.errMessage);
          } else if (state is EmailNotVerifiedState) {
            showSnackBar(
              context,
              message: "Email not verified yet. Please check your email and click the verification link.",
            );
          } else if (state is ResendEmailSuccessState) {
            showSuccessSnackBar(context, message: "Verification email sent successfully!");
          } else if (state is ResendEmailFailureState) {
            showErrorSnackBar(context, message: state.errMessage);
          }
        },
        builder: (context, state) {
          final cubit = context.read<EmailVerificationCubit>();
          bool isLoading = state is LoadingEmailVerificationState;

          return Column(
            children: [
              // Instruction text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "We've sent a verification link to your email. Please click the link to verify your email address.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Check Verification Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: CustomButton(
                  text: isLoading ? "Checking..." : "I've Verified My Email",
                  onPressed: isLoading
                      ? null
                      : () async {
                          await cubit.checkEmailVerification();
                        },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
