import 'package:event_booking_app/core/di/service_locator.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/reset_password_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RessetPasswordView extends StatelessWidget {
  const RessetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ResetPasswordCubit(getIt<UserRepo>(), getIt<AuthRepo>()),
      child: ResetPasswordViewBodyBlocBuilder(),
    );
  }

  AppBar buildAppBar() {
    return AppBar();
  }
}
