import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/reset_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RessetPasswordView extends StatelessWidget {
  const RessetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        bool isLoading = state is LoadingResetState;
        return ModalProgressHUD(
          blur: 10,
          progressIndicator: CircularProgressIndicator(color: AppColor.primary),
          inAsyncCall: isLoading,
          child: Scaffold(appBar: _buildAppBar(), body: ResetViewBody()),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar();
  }
}
