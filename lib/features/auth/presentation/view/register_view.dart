import 'package:event_booking_app/core/di/service_locator.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/register_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>(), getIt<UserRepo>()),
      child: RegisterViewBodyBlocBuilder(),
    );
  }

  AppBar buildAppBar() {
    return AppBar();
  }
}
