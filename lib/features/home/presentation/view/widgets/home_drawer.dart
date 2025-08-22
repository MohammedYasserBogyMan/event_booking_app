import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/drawer_menu_list.dart';
import 'package:event_booking_app/features/my_profile/presentation/manager/profile_cubit/cubit/profile_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              BlocBuilder<ProfileViewCubit, ProfileViewState>(
                builder: (context, state) {
                  if (state is ProfileViewLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProfileViewFailure) {
                    return Center(child: Text(state.message));
                  }
                  if (state is ProfileViewSuccess) {
                    var data = state.user;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          width: 60,
                          height: 60,
                          image: NetworkImage(data.photoUrl),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "${data.firstName} ${data.lastName}",
                          style: Styels.textStyle19,
                        ),
                      ],
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              const SizedBox(height: 50),
              DrawerMenuList(),
              const SizedBox(height: 50),
              GestureDetector(
                child: Image(
                  width: 150,
                  height: 50,
                  image: AssetImage(AssetsData.proBadge),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
