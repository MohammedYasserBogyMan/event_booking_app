import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/switch_icon.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RememberMeSection extends StatelessWidget {
  const RememberMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SwitchIcon(),
            const SizedBox(width: 5),
            Text("Remember Me", style: Styels.textStyle14),
          ],
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).go(AppRouter.kforgetpassword);
          },
          child: Text("Forgot Password?", style: Styels.textStyle14),
        ),
      ],
    );
  }
}
