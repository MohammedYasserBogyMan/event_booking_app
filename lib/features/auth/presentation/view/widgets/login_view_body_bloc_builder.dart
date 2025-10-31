import 'package:event_booking_app/core/widgets/modal_circular_progress.dart';
import 'package:event_booking_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/login_cubit/login_states.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBodyBlocBuilder extends StatelessWidget {
  const LoginViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        return CustomModalCircularProgress(
          inAsyncCall: state is LoadingLoginState ? true : false,
          child: const Scaffold(body: SafeArea(child: LoginViewBody())),
        );
      },
    );
  }
}
