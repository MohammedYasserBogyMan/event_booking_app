import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/di/service_locator.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/presentation/manager/google_signin_cubit/google_signin_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/google_signin_cubit/google_signin_states.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginOptions extends StatelessWidget {
  const SocialLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GoogleSignInCubit>(),
      child: BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
        listener: (context, state) {
          if (state is SuccessGoogleSignInState) {
            // Existing user - Fetch current user data and go to home
            BlocProvider.of<CurrentUserCubit>(context).fetchCurrentUserInfo();
            showSuccessSnackBar(context, message: "Welcome back!");
            goToNewScreen(context, locationOfNewScreen: AppRouter.kHomeView);
          } else if (state is NewUserGoogleSignInState) {
            // New user - Go to edit profile to complete registration
            showSuccessSnackBar(
              context,
              message: "Welcome! Please complete your profile",
            );
            goToNewScreen(
              context,
              locationOfNewScreen: AppRouter.kEditProfileView,
              extra: state.userModel,
            );
          } else if (state is FailureGoogleSignInState) {
            showErrorSnackBar(context, message: state.errMessage);
          }
        },
        builder: (context, state) {
          final cubit = context.read<GoogleSignInCubit>();
          bool isGoogleLoading = state is LoadingGoogleSignInState;

          return Column(
            children: [
              Text(
                "OR",
                style: Styels.textStyleMedium16
                    .copyWith(color: AppColor.orTextColor),
              ),
              const SizedBox(height: 10),
              SocialLoginButton(
                text: "Login with Google",
                image: AssetsData.loginGoogleIcon,
                isLoading: isGoogleLoading,
                onPressed: () async {
                  await cubit.signInWithGoogle();
                },
              ),
              const SizedBox(height: 17),
              SocialLoginButton(
                text: "Login with Facebook",
                image: AssetsData.loginFacebookIcon,
                onPressed: () {
                  showSnackBar(
                    context,
                    message:
                        "Facebook login not implemented yet.\nPlease use another method.",
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
