import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawerHeader extends StatefulWidget {
  const CustomDrawerHeader({super.key});

  @override
  State<CustomDrawerHeader> createState() => _CustomDrawerHeaderState();
}

class _CustomDrawerHeaderState extends State<CustomDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentUserCubit, CurrentUserState>(
      builder: (context, state) {
        if (state is CurrentUserLoading) {
          return CircularProgressIndicator(color: AppColor.primary);
        }
        if (state is CurrentUserSuccess) {
          var currentUser = state.user;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage:
                    currentUser.photoUrl.isNotEmpty &&
                            currentUser.photoUrl.startsWith('http')
                        ? CachedNetworkImageProvider(currentUser.photoUrl)
                        : AssetImage(AssetsData.defaultPhotoForNewUser),
                radius: 30,
              ),
              const SizedBox(height: 15),
              Text(
                "${currentUser.firstName} ${currentUser.lastName}",
                style: Styels.textStyle19,
              ),
            ],
          );
        } else {
          return CircularProgressIndicator(color: AppColor.primary);
        }
      },
    );
  }
}
