import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomModalCircularProgress extends StatelessWidget {
  const CustomModalCircularProgress({
    super.key,
    required this.child,
    required this.inAsyncCall,
  });
  final Widget child;
  final bool inAsyncCall;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      blur: 100,
      progressIndicator: CircularProgressIndicator(color: AppColor.primary),
      inAsyncCall: inAsyncCall,
      child: child,
    );
  }
}
