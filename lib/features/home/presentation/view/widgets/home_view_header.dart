import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/custom_home_appbar.dart';
import 'package:flutter/material.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.darkPurple,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          CustomHomeAppbar(),
          SizedBox(height: 20),

          Row(
            children: [
              Icon(Icons.search, color: Colors.white, size: 30),
              SizedBox(width: 10),
              Container(
                height: 25,
                width: 1.5,
                color: Colors.white.withAlpha(70),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.white.withAlpha(70)),
                    border: InputBorder.none,
                  ),
                  style: Styels.textStyle20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
