import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/modal_circular_progress.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/sign_out_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutView extends StatelessWidget {
  const SignOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        bool isLoading = state is LoadingSignOutState;
        return ModalCircularProgress(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Sign Out", style: Styels.textStyle24),
              centerTitle: true,
              backgroundColor: AppColor.primary,
            ),
            body: SignOutViewBody(),
          ),
        );
      },
    );
  }
}
