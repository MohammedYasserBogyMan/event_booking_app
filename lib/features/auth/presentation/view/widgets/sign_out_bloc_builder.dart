import 'package:event_booking_app/core/widgets/modal_circular_progress.dart';
import 'package:event_booking_app/features/auth/presentation/manager/signout_cubit/signout_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/signout_cubit/signout_states.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/sign_out_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutBlocBuilder extends StatelessWidget {
  const SignOutBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignOutCubit, SignoutStates>(
        builder: (context, state) {
          return ModalCircularProgress(
            inAsyncCall: state is LoadingSignOutState ? true : false,
            child: Scaffold(
              appBar: buildAppBar(),
              body: SafeArea(child: SignOutViewBody()),
            ),
          );
        },
      );
  }
  
  buildAppBar() {}
}