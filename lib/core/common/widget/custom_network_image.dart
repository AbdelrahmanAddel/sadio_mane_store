import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.errorImage =
        'https://static.vecteezy.com/system/resources/previews/022/059/000/non_2x/no-image-available-icon-vector.jpg',
    this.borderRadius,
  });
  final String imageUrl;
  final double? width;
  final double? height;
  final String? errorImage;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 14),
      child: CachedNetworkImage(
        width: width ?? 100.w,
        height: height ?? 100.h,
        imageUrl: imageUrl == '' ? errorImage! : imageUrl,
        fit: BoxFit.fill,
        placeholder: (context, url) => _buildLoadingImage(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _buildLoadingImage() {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade600,
        highlightColor: Colors.grey.shade400,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 14)),
          ),
        ),
      ),
    );
  }
}
