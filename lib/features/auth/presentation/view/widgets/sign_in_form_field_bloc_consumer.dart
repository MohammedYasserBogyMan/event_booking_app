import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInFormFieldsBlocConsumer extends StatelessWidget {
  const SignInFormFieldsBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          showSuccessSnackBar(context, message: "Login successful");
          goToNewScreen(context, locationOfNewScreen: AppRouter.kHomeView);
        } else if (state is FailureLoginState) {
          showErrorSnackBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        return child;
      },
    );
  }
}