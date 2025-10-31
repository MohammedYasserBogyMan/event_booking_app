import 'package:event_booking_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/signout_cubit/signout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// register function
registerToOurApplication(
  BuildContext context, {
  required String email,
  required String password,
  required String name,
}) async {
  await BlocProvider.of<RegisterCubit>(context).register(
    email: email,
    password: password,
    firstName: name.split(" ")[0],
    lastName: name.split(" ").length > 1 ? name.split(" ")[1] : "",
  );
}

// login function
loginInOurApplication(
  BuildContext context, {
  required String email,
  required String password,
}) async {
  await BlocProvider.of<LoginCubit>(
    context,
  ).login(email: email, password: password, context: context);
}

// resetPassword function
void resetPasswordToOurApplication(
  BuildContext context, {
  required String email,
}) {
  BlocProvider.of<ResetPasswordCubit>(context).resetPassword(email: email);
}

Future<void> signOutFromOurApplication(BuildContext context) =>
    BlocProvider.of<SignOutCubit>(context).signOut();
