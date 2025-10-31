import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/widgets/modal_circular_progress.dart';
import 'package:event_booking_app/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:event_booking_app/features/auth/presentation/manager/register_cubit/register_states.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBodyBlocBuilder extends StatelessWidget {
  const RegisterViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
        builder: (context, state) {
          return ModalCircularProgress(
            inAsyncCall: state is LoadingRegisterState ? true : false,
            child: Scaffold(
              appBar: buildAppBar(),
              body: SafeArea(child: RegisterViewBody()),
            ),
          );
        },
      );
  }
}