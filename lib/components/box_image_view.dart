import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading_widget.dart';

class BoxViewImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  const BoxViewImage({super.key,required this.url, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      width: width,
      height: height,
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder: (context, url) => const LoadingWidget(),
      imageUrl: url,
    );
  }
}
