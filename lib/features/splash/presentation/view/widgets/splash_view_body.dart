// ignore_for_file: use_build_context_synchronously

import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/features/splash/presentation/manager/splash_cubit/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    slidingTransitionAnimation();
    _controller.forward();

    Future.delayed(const Duration(seconds: 5), () {
      BlocProvider.of<SplashCubit>(context).decideStartDestination();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is GoOnboarding) {
          context.go(AppRouter.kOnboarding);
        } else if (state is GoHome) {
          context.go(AppRouter.kHomeView);
        } else if (state is GoLogin) {
          context.go(AppRouter.kLogin);
        }
      },
      child: Center(
        child: SlideTransition(
          position: _animation,
          child: Image.asset(AssetsData.splashLogo),
        ),
      ),
    );
  }

  void slidingTransitionAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }
}
