import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/services/shared_prefs_service.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignOutHandler extends StatelessWidget {
  const SignOutHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) async {
        if (state is SuccessSignOutState) {
          await context.read<CurrentUserCubit>().reset();
          await SharedPrefsService.I.clearAll();
          GoRouter.of(context).go(AppRouter.kLogin);
          showSnackBar(context, message: "successSignOut");
        } else if (state is FailureSignOutState) {
          showSnackBar(
            context,
            message: "Error signing out: ${state.errMessage}",
          );
        }
      },
      builder: (context, state) {
        return state is LoadingSignOutState
            ? Center(child: CircularProgressIndicator(color: AppColor.primary))
            : CustomButton(
              text: "SignOut",
              onPressed: () {
                signOutFunc(context);
              },
            );
      },
    );
  }

  Future<void> signOutFunc(BuildContext context) =>
      BlocProvider.of<AuthCubit>(context).signOut();
}
