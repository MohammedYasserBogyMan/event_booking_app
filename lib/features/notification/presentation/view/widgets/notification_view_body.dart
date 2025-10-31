import 'package:event_booking_app/core/controllers/chat_cubit/chat_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/core/di/service_locator.dart';
import 'package:event_booking_app/core/repositories/messaging_repo/messaging_repo.dart';
import 'package:event_booking_app/features/messaging/presentation/view/chat_view.dart';
import 'package:event_booking_app/features/notification/data/models/app_notification.dart';
import 'package:event_booking_app/features/notification/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:event_booking_app/features/notification/presentation/view/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  void _loadNotifications() {
    final currentUserState = context.read<CurrentUserCubit>().state;
    if (currentUserState is CurrentUserSuccess) {
      context.read<NotificationCubit>().watchNotifications(
            userId: currentUserState.user.uid,
          );
    }
  }

  void _handleNotificationTap(BuildContext context, AppNotification notification) {
    switch (notification.type) {
      case NotificationType.message:
        // Navigate to chat with the sender
        final senderId = notification.data?['senderId'] as String?;
        if (senderId != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => ChatCubit(messagingRepo: getIt<MessagingRepo>()),
                child: ChatView(
                  otherUserId: senderId,
                  otherUserName: notification.fromUserName,
                  otherUserPhoto: notification.fromUserImage,
                ),
              ),
            ),
          );
        }
        break;

      case NotificationType.follow:
      case NotificationType.booking:
      case NotificationType.eventUpdate:
      case NotificationType.info:
        // TODO: Add navigation for other notification types if needed
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUserState = context.read<CurrentUserCubit>().state;
    if (currentUserState is! CurrentUserSuccess) {
      return const Center(
        child: Text('Please sign in to view notifications'),
      );
    }

    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is NotificationFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Failed to load notifications',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  state.message,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loadNotifications,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is NotificationLoaded) {
          if (state.notifications.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications yet',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'When you get notifications, they will appear here',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[500],
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              _loadNotifications();
            },
            child: ListView.separated(
              itemCount: state.notifications.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final notification = state.notifications[index];
                return NotificationWidget(
                  notificationModel: notification,
                  onTap: () {
                    // Mark as read when tapped
                    if (!notification.isRead) {
                      context.read<NotificationCubit>().markAsRead(
                            notificationId: notification.id,
                            userId: currentUserState.user.uid,
                          );
                    }

                    // Navigate based on notification type
                    _handleNotificationTap(context, notification);
                  },
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
