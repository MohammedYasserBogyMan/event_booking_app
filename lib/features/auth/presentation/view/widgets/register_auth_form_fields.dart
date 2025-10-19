import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/register_form_fields.dart';
import 'package:event_booking_app/features/auth/logic/auth_functions.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationAuthFormFields extends StatefulWidget {
  const RegistrationAuthFormFields({super.key});

  @override
  State<RegistrationAuthFormFields> createState() =>
      _RegistrationAuthFormFieldsState();
}

class _RegistrationAuthFormFieldsState
    extends State<RegistrationAuthFormFields> {
  String? email, password, name;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoadingRegisterState) {
        } else if (state is SuccessRegisterState) {
          showSnackBar(context, message: "SuccessRegister");
          final newUser = UserModel(
            uid: FirebaseAuth.instance.currentUser!.uid,
            firstName: name!,
            lastName: "",
            email: email!,
            photoUrl: AssetsData.defaultPhotoForNewUser,
            location: "",
            about: "",
            followersCount: 0,
          );
          pushToNewScreen(
            context,
            locationOfNewScreen: AppRouter.kVerification,
            extra: newUser,
          );
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
                  RegisterFormFields(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " ";
                      }
                      return null;
                    },
                    icon: Icons.person_outline,
                    hintText: "Full name",
                    onSaved: (p0) {
                      name = p0;
                    },
                  ),
                  const SizedBox(height: 10),
                  RegisterFormFields(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " ";
                      }
                      return null;
                    },
                    onSaved: (p0) {
                      email = p0;
                    },
                    icon: Icons.email_outlined,
                    hintText: "abc@email.com",
                  ),
                  const SizedBox(height: 10),
                  RegisterFormFields(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " ";
                      }
                      return null;
                    },
                    icon: Icons.lock_outlined,
                    hintText: "Your password",
                    onSaved: (p0) {
                      password = p0;
                      passwordController.clear();
                    },
                    isPassword: true,
                  ),
                  const SizedBox(height: 10),
                  RegisterFormFields(
                    controller: confirmPasswordController,
                    onSaved: (p0) {
                      password = p0;
                      confirmPasswordController.clear();
                    },
                    validator: (value) {
                      if (value != passwordController.text) {
                        return "password does not match";
                      }
                      return null;
                    },
                    icon: Icons.lock_outlined,
                    hintText: "Confirm password",
                    isPassword: true,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: CustomButton(
                      text: "SIGN UP",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          await registerToOurApplication(
                            context,
                            email: email!,
                            password: password!,
                            name: name!,
                          );
                          passwordController.clear();
                          confirmPasswordController.clear();
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
