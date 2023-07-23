import 'package:flutter/material.dart';

Widget profileAppBar(double width, String image) {
  return SliverAppBar(
    expandedHeight: 20,
    elevation: 10,
    // collapsedHeight: 70,
    // floating: true,
    // pinned: true,
    stretch: true,
    flexibleSpace: FlexibleSpaceBar(
      stretchModes: const [
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle
      ],
      background: Image.network(
        image,
        fit: BoxFit.cover,
        width: width,
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(150.0),
      child: Transform.translate(
        offset: Offset(-width / 3, 50),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            image,
          ),
        ),
      ),
    ),
  );
}
