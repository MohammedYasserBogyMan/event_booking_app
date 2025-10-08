import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/search/filters/widgets/thumb_shape_indector.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({super.key});

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  SfRangeValues rangeValues = const SfRangeValues(20.0, 120.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Select price range", style: Styels.textStyleMedium16),
            const Spacer(),
            Text(
              "\$${(rangeValues.start as double).toInt()} - \$${(rangeValues.end as double).toInt()}",
              style: Styels.textStyleMedium16.copyWith(color: AppColor.primary),
            ),
          ],
        ),
        const SizedBox(height: 30),
        SfRangeSliderTheme(
          data: SfRangeSliderThemeData(
            activeTrackHeight: 4,
            inactiveTrackHeight: 4,
            activeTrackColor: AppColor.primary,
            inactiveTrackColor: AppColor.primary.withAlpha(100),
            overlayRadius: 0,
          ),
          child: SfRangeSlider(
            min: 0.0,
            max: 200.0,
            values: rangeValues,
            interval: 50,
            showTicks: false,
            showLabels: false,
            enableTooltip: false,
            thumbShape: ImageThumbShape(
              "assets/images/thumbshape.png",
              onImageLoaded: () => setState(() {}),
            ),
            onChanged: (SfRangeValues values) {
              setState(() {
                rangeValues = values;
              });
            },
          ),
        ),
      ],
    );
  }
}
