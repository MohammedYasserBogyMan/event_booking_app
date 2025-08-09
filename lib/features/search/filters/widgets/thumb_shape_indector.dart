import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ImageThumbShape extends SfThumbShape {
  final String assetPath;
  final double size;

  ImageThumbShape(this.assetPath, {this.size = 35});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required RenderBox? child,
    dynamic currentValue,
    SfRangeValues? currentValues,
    required Animation<double> enableAnimation,
    required Paint? paint,
    required RenderBox parentBox,
    required TextDirection textDirection,
    required SfSliderThemeData themeData,
    required SfThumb? thumb,
  }) {
    final canvas = context.canvas;
    final image = AssetImage(assetPath);

    image
        .resolve(const ImageConfiguration())
        .addListener(
          ImageStreamListener((info, _) {
            final img = info.image;
            canvas.drawImageRect(
              img,
              Rect.fromLTWH(0, 0, img.width.toDouble(), img.height.toDouble()),
              Rect.fromCenter(center: center, width: size, height: size),
              Paint(),
            );
          }),
        );
  }
}
