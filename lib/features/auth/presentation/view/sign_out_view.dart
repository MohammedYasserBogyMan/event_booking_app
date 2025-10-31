import 'package:event_booking_app/core/di/service_locator.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/signout_cubit/signout_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/sign_out_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutView extends StatelessWidget {
  const SignOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(getIt<UserRepo>(), getIt<AuthRepo>()),
      child: SignOutBlocBuilder(),
    );
  }
}
