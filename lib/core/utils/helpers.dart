import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/constants/cons.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(minutes: 1),
      backgroundColor: AppColor.primary,
      content: Center(
        child: Text(message, style: TextStyle(fontSize: 20, fontFamily: kFont)),
      ),
    ),
  );
}

Future<dynamic> showSheet(BuildContext context, {required Widget child}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    context: context,
    backgroundColor: Colors.white,
    builder: (context) => child,
  );
}

registerToOurApplication(
  BuildContext context, {
  required String email,
  required String password,
  required String name,
}) async {
  await BlocProvider.of<AuthCubit>(context).register(
    email: email,
    password: password,
    firstName: name.split(" ")[0],
    lastName: name.split(" ").length > 1 ? name.split(" ")[1] : "",
  );
}



  loginInOurApplication(BuildContext context,{required String email,required String password}) async {
    await BlocProvider.of<AuthCubit>(
      context,
    ).login(email: email, password: password, context: context);
  }