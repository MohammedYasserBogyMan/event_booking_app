import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/notification/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => openDrawer(context),
          child: Icon(Icons.menu, color: Colors.white, size: 30),
        ),
        BlocBuilder<CurrentUserCubit, CurrentUserState>(
          builder: (context, state) {
            String userLocation = "Not set";

            if (state is CurrentUserSuccess && state.user.location.isNotEmpty) {
              userLocation = state.user.location;
            }

            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Current Location',
                      style: Styels.textStyleRegular12.copyWith(
                        color: const Color.fromARGB(162, 255, 255, 255),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
                Text(
                  userLocation,
                  style: Styels.textStyleRegular13.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ],
            );
          },
        ),
        GestureDetector(
          onTap: () {
            pushToNewScreen(
              context,
              locationOfNewScreen: AppRouter.kNotificationView,
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(20),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              // Unread count badge
              BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  if (state is NotificationLoaded && state.unreadCount > 0) {
                    return Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: EdgeInsets.all(state.unreadCount > 9 ? 3 : 5),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Text(
                          state.unreadCount > 99 ? '99+' : '${state.unreadCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
