import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/remember_me_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInAuthFormFields extends StatefulWidget {
  const SignInAuthFormFields({super.key});

  @override
  State<SignInAuthFormFields> createState() => _SignInAuthFormFieldsState();
}

class _SignInAuthFormFieldsState extends State<SignInAuthFormFields> {
  String? email, password;
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          showSnackBar(context, message: "Success Login");
          goToNewScreen(context, locationOfNewScreen: AppRouter.kHomeView);
        } else if (state is FailureLoginState) {
          showSnackBar(context, message: state.errMessage);
        }
      },
      builder:
          (context, state) => Form(
            key: formkey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                CustomTextFiled(
                  onSaved: (p0) {
                    email = p0;
                  },
                  hintText: 'abc@email.com',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 19),
                CustomTextFiled(
                  onSaved: (p0) {
                    password = p0;
                  },
                  hintText: 'Your password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                RememberMeSection(),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: CustomButton(
                    text: 'SIGN IN',
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        await loginInOurApplication(
                          context,
                          email: email!,
                          password: password!,
                        );
                        formkey.currentState!.reset();
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
    );
  }
}
