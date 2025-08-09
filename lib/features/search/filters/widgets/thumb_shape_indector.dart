import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ImageThumbShape extends SfThumbShape {
  final String assetPath;
  final double size;
  final VoidCallback onImageLoaded;
  static final Map<String, ui.Image> _imageCache = {};

  ui.Image? image;

  ImageThumbShape(
    this.assetPath, {
    this.size = 35,
    required this.onImageLoaded,
  }) {
    _loadImage();
  }

  Future<void> _loadImage() async {
    if (_imageCache.containsKey(assetPath)) {
      image = _imageCache[assetPath];
      return;
    }

    final data = await rootBundle.load(assetPath);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    image = frame.image;
    _imageCache[assetPath] = image!;
    onImageLoaded();
  }

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

    if (image != null) {
      canvas.drawImageRect(
        image!,
        Rect.fromLTWH(0, 0, image!.width.toDouble(), image!.height.toDouble()),
        Rect.fromCenter(center: center, width: size, height: size),
        Paint(),
      );
    } else {
      final tempPaint = Paint()..color = Colors.grey;
      canvas.drawCircle(center, size / 2, tempPaint);
    }
  }
}
