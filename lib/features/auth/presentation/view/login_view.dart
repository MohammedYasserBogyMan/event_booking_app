import 'package:event_booking_app/core/widgets/modal_circular_progress.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        bool isLoading = state is LoadingLoginState;
        return ModalCircularProgress(
          inAsyncCall: isLoading,
          child: const Scaffold(body: SafeArea(child: LoginViewBody())),
        );
      },
    );
  }
}
