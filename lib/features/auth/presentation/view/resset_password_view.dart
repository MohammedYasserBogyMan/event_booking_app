import 'package:event_booking_app/core/widgets/modal_circular_progress.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/reset_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RessetPasswordView extends StatelessWidget {
  const RessetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        return ModalCircularProgress(
          inAsyncCall: state is LoadingResetState ? true : false,
          child: Scaffold(
            appBar: _buildAppBar(),
            body: SafeArea(child: ResetViewBody()),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar();
  }
}
