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

class RegistrationAuthFormFields extends StatefulWidget {
  const RegistrationAuthFormFields({super.key});

  @override
  State<RegistrationAuthFormFields> createState() =>
      _RegistrationAuthFormFieldsState();
}

class _RegistrationAuthFormFieldsState
    extends State<RegistrationAuthFormFields> {
  String? email, name, password;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoadingRegisterState) {
        } else if (state is SuccessRegisterState) {
          showSnackBar(context, message: "SuccessRegister");
          GoRouter.of(context).go(AppRouter.kVerification, extra: email);
        } else if (state is FailureRegisterState) {
          showSnackBar(context, message: state.errMessage);
        }
      },
      builder:
          (context, state) => ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  CustomTextFiled(
                    icon: Icons.person_outline,
                    hintText: "Full name",
                    onSaved: (p0) {
                      name = p0;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFiled(
                    onSaved: (p0) {
                      email = p0;
                    },
                    icon: Icons.email_outlined,
                    hintText: "abc@email.com",
                  ),
                  const SizedBox(height: 10),
                  CustomTextFiled(
                    icon: Icons.lock_outlined,
                    hintText: "Your password",
                    onSaved: (p0) {
                      password = p0;
                    },
                    isPassword: true,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFiled(
                    icon: Icons.lock_outlined,
                    hintText: "Confirm password",
                    onSaved: (p0) {
                      password = p0;
                    },
                    isPassword: true,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: CustomButton(
                      text: "SIGN UP",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          await BlocProvider.of<AuthCubit>(context).register(
                            email: email!,
                            password: password!,
                            firstName: name!.split(" ")[0],
                            lastName:
                                name!.split(" ").length > 1
                                    ? name!.split(" ")[1]
                                    : "",
                          );
                          formKey.currentState!.reset();
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
