import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCacheManager {
  static const Duration cacheStaleTime = Duration(days: 1);
  static const int maxCacheObjects = 200;

  static CachedNetworkImageProvider getCachedImage(String imageUrl) {
    return CachedNetworkImageProvider(
      imageUrl,
      maxHeight: 800,
      maxWidth: 800,
      cacheKey: imageUrl,
    );
  }

  static Widget buildCachedImage({
    required String imageUrl,
    BoxFit fit = BoxFit.cover,
    double? width,
    double? height,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      maxHeightDiskCache: 800,
      maxWidthDiskCache: 800,
      memCacheHeight: 400,
      memCacheWidth: 400,
      placeholder:
          (context, url) =>
              placeholder ??
              Container(
                color: Colors.grey[200],
                child: Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.grey[400]!,
                      ),
                    ),
                  ),
                ),
              ),
      errorWidget:
          (context, url, error) =>
              errorWidget ??
              Container(
                color: Colors.grey[200],
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey[400],
                  size: 40,
                ),
              ),
      fadeInDuration: const Duration(milliseconds: 300),
      fadeOutDuration: const Duration(milliseconds: 100),
    );
  }

  static Widget buildCachedCircleAvatar({
    required String imageUrl,
    required double radius,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: radius * 2,
        height: radius * 2,
        maxHeightDiskCache: 300,
        maxWidthDiskCache: 300,
        memCacheHeight: 150,
        memCacheWidth: 150,
        placeholder:
            (context, url) =>
                placeholder ??
                Container(
                  width: radius * 2,
                  height: radius * 2,
                  color: Colors.grey[200],
                  child: Center(
                    child: SizedBox(
                      width: radius * 0.5,
                      height: radius * 0.5,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.grey[400]!,
                        ),
                      ),
                    ),
                  ),
                ),
        errorWidget:
            (context, url, error) =>
                errorWidget ??
                Container(
                  width: radius * 2,
                  height: radius * 2,
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.person,
                    color: Colors.grey[400],
                    size: radius,
                  ),
                ),
        fadeInDuration: const Duration(milliseconds: 200),
        fadeOutDuration: const Duration(milliseconds: 100),
      ),
    );
  }

  static Future<void> preloadImage(
    String imageUrl,
    BuildContext context,
  ) async {
    try {
      await precacheImage(CachedNetworkImageProvider(imageUrl), context);
    } catch (e) {
      debugPrint('Failed to preload image: $e');
    }
  }

  static Future<void> clearCache() async {
    await CachedNetworkImage.evictFromCache('');
  }
}
