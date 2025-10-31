import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:event_booking_app/features/auth/logic/auth_functions.dart';
import 'package:event_booking_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/reset_password_cubit/reset_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordAuthFormField extends StatefulWidget {
  const ResetPasswordAuthFormField({super.key});

  @override
  State<ResetPasswordAuthFormField> createState() =>
      _ResetPasswordAuthFormFieldState();
}

class _ResetPasswordAuthFormFieldState
    extends State<ResetPasswordAuthFormField> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? email;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
      listener: (context, state) {
        if (state is LoadingResetState) {
        } else if (state is SuccessResetState) {
          showSuccessSnackBar(context, message: "Password reset link sent successfully");
          goToNewScreen(context, locationOfNewScreen: AppRouter.kLogin);
        } else if (state is FailureResetState) {
          showErrorSnackBar(context, message: state.errMessage);
        }
      },
      builder:
          (context, state) => Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                CustomTextFiled(
                  icon: Icons.mail_outlined,
                  hintText: "abc@email.com",
                  onSaved: (p0) {
                    email = p0;
                  },
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        resetPasswordToOurApplication(context, email: email!);
                        formKey.currentState!.reset();
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    text: "SEND",
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
