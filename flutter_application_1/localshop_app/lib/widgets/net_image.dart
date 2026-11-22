import 'package:flutter/material.dart';

/// Small wrapper around Image.network that shows a loading placeholder
/// and a graceful fallback icon if the image fails to load.
class NetImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;

  const NetImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(
          width: width,
          height: height,
          color: const Color(0xFFEAEDFF),
          child: const Center(
            child: SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stack) => Container(
        width: width,
        height: height,
        color: const Color(0xFFEAEDFF),
        child: const Icon(Icons.image_outlined, color: Color(0xFF6D7A72)),
      ),
    );
  }
}
