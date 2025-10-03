import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/services/shared_prefs_service.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignOutViewBody extends StatelessWidget {
  const SignOutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.logout, size: 80, color: AppColor.primary),
              const SizedBox(height: 20),
              Text(
                "Are you sure you want to sign out?",
                style: Styels.textStyle35,
              ),
              const SizedBox(height: 30),
              BlocConsumer<AuthCubit, AuthStates>(
                listener: (context, state) async {
                  if (state is SuccessSignOutState) {
                    await SharedPrefsService.I.clearAll();
                    await context.read<CurrentUserCubit>().logout();
                  } else if (state is FailureSignOutState) {
                    showSnackBar(context, message: state.errMessage);
                  }
                },

                builder: (context, state) {
                  return ElevatedButton.icon(
                    onPressed: () => _signOut(context),
                    icon: const Icon(Icons.logout),
                    label: const Text(
                      "Sign Out",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await SharedPrefsService.I.clearAll();
      context.read<AuthCubit>().signOut();
      GoRouter.of(context).go(AppRouter.kLogin);
    } catch (e) {
      showSnackBar(context, message: "Error signing out: $e");
    }
  }
}
