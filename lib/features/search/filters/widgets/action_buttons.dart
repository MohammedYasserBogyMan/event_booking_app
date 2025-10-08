import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey),
              ),
              child: const Text("RESET", style: Styels.textStyleMedium16),
            ),
          ),
        ),
        const SizedBox(width: 20),
        // زر APPLY
        Expanded(
          child: GestureDetector(
            onTap: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder:
                    (_) => const Center(child: CircularProgressIndicator()),
              );
              await Future.delayed(const Duration(seconds: 2));

              if (!context.mounted) return;

              context.pop();
              context.pop();
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                "APPLY",
                style: Styels.textStyleMedium16.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
