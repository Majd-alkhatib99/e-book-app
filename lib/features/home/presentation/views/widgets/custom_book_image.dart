import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: AspectRatio(
            aspectRatio: 2.6 / 4,
            child: CachedNetworkImage(
              imageUrl: imageURL,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error),
              ),
            )),
      ),
    );
  }
}

// Container(
// decoration:  BoxDecoration(
// borderRadius: const BorderRadius.all(Radius.circular(16.0)),
// image: DecorationImage(
// fit: BoxFit.cover,
// image: NetworkImage(imageURL))),
// ),
