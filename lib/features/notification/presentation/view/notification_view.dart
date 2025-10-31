import 'package:event_booking_app/core/di/service_locator.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/notification/data/repositories/notification_repo.dart';
import 'package:event_booking_app/features/notification/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:event_booking_app/features/notification/presentation/view/widgets/notification_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(
        notificationRepo: getIt<NotificationRepo>(),
      ),
      child: Scaffold(appBar: _buildAppBar(), body: NotificationViewBody()),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      title: const Text("Notification", style: Styels.textStyleRegular24),
    );
  }
}
