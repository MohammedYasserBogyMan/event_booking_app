import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo_impl.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo_imple.dart';
import 'package:event_booking_app/features/my_profile/presentation/manager/profile_cubit/cubit/profile_view_cubit.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/widgets/my_profile_view_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => ProfileViewCubit(
            UserRepoImpl(FirebaseFirestore.instance),
            AuthRepoImple(FirebaseAuth.instance),
          )..fetchMyProfile(),
      child: Scaffold(appBar: _buildAppBar(), body: const MyProfileViewBody()),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(title: Text("Profile", style: Styels.textStyle24));
  }
}
