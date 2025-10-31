import 'package:event_booking_app/core/widgets/modal_circular_progress.dart';
import 'package:event_booking_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/reset_password_cubit/reset_password_states.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/reset_view_body.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/sign_out_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordViewBodyBlocBuilder extends StatelessWidget {
  const ResetPasswordViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordStates>(
        builder: (context, state) {
          return ModalCircularProgress(
            inAsyncCall: state is LoadingResetState ? true : false,
            child: Scaffold(
              appBar: buildAppBar(),
              body: SafeArea(child: ResetViewBody()),
            ),
          );
        },
      );
  }
}