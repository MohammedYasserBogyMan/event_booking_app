import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'widgets/category_section.dart';
import 'widgets/time_selector.dart';
import 'widgets/location_selector.dart';
import 'widgets/price_slider.dart';
import 'widgets/action_buttons.dart';

void showFilterBottomSheet(BuildContext context) {
  showSheet(
    context,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 20),
              Text("Filter", style: Styels.textStyle24),
              SizedBox(height: 20),
              CategorySelector(),
              SizedBox(height: 26),
              TimeSelector(),
              SizedBox(height: 26),
              LocationSelector(),
              SizedBox(height: 24),
              PriceSlider(),
              SizedBox(height: 40),
              ActionButtons(),
            ],
          ),
        ),
      ),
    ),
  );
}
