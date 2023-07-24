import 'package:flutter/material.dart';

import '../../common/show_modal_bottom_sheet.dart';

class StickyHeader extends SliverPersistentHeaderDelegate {
  final double height;

  StickyHeader({this.height = 80});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    var newValue = shrinkOffset - height;
    var size = 0.0;
    if (newValue.abs() > 245) {
      size = newValue.abs() - 48;
    } else {
      size = newValue.abs();
    }

    var theme = Theme.of(context);
    var width = MediaQuery.sizeOf(context).width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: width / 18),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: size,
              child: Opacity(
                opacity: 1.0,
                child: Column(
                  children: [
                    newValue.abs() < 100
                        ? Container()
                        : editProfileAndMore(theme),
                    newValue.abs() < 140 ? Container() : gap(),
                    newValue.abs() < 160
                        ? Container()
                        : SizedBox(
                            width: width,
                            child: Text(
                              "Lost Dreamer",
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                    newValue.abs() < 170 ? Container() : lessGap(),
                    newValue.abs() < 210 ? Container() : dateAndNickName(width),
                    newValue.abs() < 240 ? Container() : gap(),
                    newValue.abs() < 260
                        ? Container()
                        : RichText(
                            text: TextSpan(
                                text:
                                    "A quick brown fox jumps over the lazy dog...A quick brown fox jumps over the lazy dog...A quick brown fox jumps over the lazy dog",
                                style: theme.textTheme.labelLarge),
                          ),
                    newValue.abs() < 260 ? Container() : gap(),
                    newValue.abs() < 270
                        ? Container()
                        : viewsSection(theme, width),
                    // gap(),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.green,
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  Container editProfileAndMore(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(""),
          const Spacer(),
          MaterialButton(
            shape: const StadiumBorder(),
            color: theme.colorScheme.secondary,
            onPressed: () {},
            textTheme: theme.buttonTheme.textTheme,
            child: const Text(
              "Edit Profile",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          ClipOval(
              child: Container(
                  color: theme.colorScheme.primaryContainer,
                  child: const Icon(Icons.more_horiz))),
        ],
      ),
    );
  }

  Widget viewsSection(ThemeData theme, width) {
    return SizedBox(
      width: width,
      child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(text: "", children: [
            TextSpan(text: "12 ", style: theme.textTheme.bodyLarge),
            TextSpan(text: "Following ", style: theme.textTheme.bodyMedium),
            TextSpan(text: " • ", style: theme.textTheme.bodyLarge),
            TextSpan(text: "11 ", style: theme.textTheme.bodyLarge),
            TextSpan(text: "Followers ", style: theme.textTheme.bodyMedium),
          ])),
    );
  }

  SizedBox dateAndNickName(double width) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text("@lostdreamer"),
          lessWidthGap(),
          SizedBox(
            width: width / 3,
            child: const Row(
              children: [
                Icon(
                  Icons.date_range,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("10-18-2002"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
