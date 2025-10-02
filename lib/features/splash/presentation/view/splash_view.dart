import 'package:event_booking_app/features/splash/presentation/view/widgets/splash_view_body.dart';
import 'package:event_booking_app/features/splash/presentation/manager/splash_cubit/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashCubit(),
        child: const SplashViewBody(),
      ),
    );
  }
}
