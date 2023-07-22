import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/data/model/twitter.dart';
import 'package:twitter_clone/presentation/pages/common/show_modal_bottom_sheet.dart';
import 'package:twitter_clone/presentation/pages/profle/widget/cubit/profile_header_cubit_state.dart';

import '../reply_tweets/reply_tweet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  var image =
      "https://images.unsplash.com/photo-1628260412297-a3377e45006f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2874";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.sizeOf(context);
    var width = size.width;
    var height = size.height;
    return Scaffold(
        body: CustomScrollView(
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        profileAppBar(width),
        SliverPersistentHeader(
          delegate: StickyHeader(
              image: image, height: width / 1.1, controller: controller),
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Column(children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: width / 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height,
                    child: TabBarView(controller: controller, children: [
                      ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return ReplyContainer(
                            theme: theme,
                            tweet: TweetModel(
                              id: "1",
                              body: 'body',
                              createdAt: DateTime.now().toString(),
                              user: User(
                                id: "1",
                                createdAt: DateTime.now().toString(),
                                email: 'dreamer@gmail.com',
                                username: 'dreamer',
                              ),
                              userId: '1',
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 10,
                          );
                        },
                      ),
                      Container(
                        color: Colors.green,
                        height: 10,
                      ),
                      Container(
                        color: Colors.cyan,
                        height: 10,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ])
        ])),
      ],
    ));
  }

  SliverAppBar profileAppBar(double width) {
    return SliverAppBar(
      expandedHeight: 200,
      elevation: 10,
      collapsedHeight: 100,
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
}

class StickyHeader extends SliverPersistentHeaderDelegate {
  final double height;
  final String image;
  final TabController controller;
  StickyHeader(
      {this.height = 80, required this.image, required this.controller});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    log("testing shrink value ${shrinkOffset}");

    // if (shrinkOffset > 1) {
    //   context.read<ProfileHeaderCubit>().setValue(true);
    // } else if (shrinkOffset < 1) {
    //   context.read<ProfileHeaderCubit>().setValue(false);
    // }
    var theme = Theme.of(context);
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: width / 18),
      child: Column(
        children: [
          Column(
            children: [
              Opacity(
                opacity: shrinkOffset < 5 ? 1 : 0,
                child:
                    shrinkOffset < 5 ? editProfileAndMore(theme) : Container(),
              ),
              shrinkOffset < 5 ? gap() : Container(),
              SizedBox(
                width: width,
                child: Text(
                  "Lost Dreamer",
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              lessGap(),
              dateAndNickName(width),
              gap(),
              RichText(
                  text: TextSpan(
                      text:
                          "A quick brown fox jumps over the lazy dog...A quick brown fox jumps over the lazy dog...A quick brown fox jumps over the lazy dog",
                      style: theme.textTheme.labelLarge)),
              gap(),
              viewsSection(theme, width),
            ],
          ),
          gap(),
          TabBar(controller: controller, tabs: const [
            Tab(
              text: "Tweets",
            ),
            Tab(
              text: "Reply",
            ),
            Tab(
              text: "Likes",
            ),
          ]),
        ],
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
