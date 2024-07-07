import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/loading/image_loading.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) => const ImageLoading(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          height: size.height * 0.35,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
