import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoadingResetState) {
        } else if (state is SuccessResetState) {
          showSnackBar(context, message: "success Reset");
          GoRouter.of(context).go(AppRouter.kLogin);
        } else if (state is FailureResetState) {
          showSnackBar(context, message: state.errMessage);
        }
      },
      builder:
          // logic of modal progress HUD does not apply
          (context, state) => ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Form(
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
                          BlocProvider.of<AuthCubit>(
                            context,
                          ).resetPassword(email: email!);
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
          ),
    );
  }
}
