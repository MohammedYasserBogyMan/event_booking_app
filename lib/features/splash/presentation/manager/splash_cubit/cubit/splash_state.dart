part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class GoOnboarding extends SplashState {}

class GoLogin extends SplashState {}

class GoHome extends SplashState {}
