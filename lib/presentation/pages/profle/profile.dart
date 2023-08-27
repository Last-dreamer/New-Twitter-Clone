import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/data/model/twitter.dart';
import 'package:twitter_clone/presentation/pages/profle/widget/cubit/tab_index.dart';
import 'package:twitter_clone/presentation/pages/profle/widget/profile_appbar.dart';
import 'package:twitter_clone/presentation/pages/profle/widget/sticky_header.dart';
import '../reply_tweets/reply_tweet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  var image =
      "https://images.unsplash.com/photo-1628260412297-a3377e45006f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2874";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.sizeOf(context);
    var width = size.width;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            profileAppBar(width, image),
            SliverPersistentHeader(
              delegate: StickyHeader(height: 320),
              pinned: true,
            ),
            getSliverList(context, theme)
          ],
        ),
      ),
    );
  }

  Widget getSliverList(BuildContext context, theme) {
    var state = context.watch<TabIndexCubit>().state;

    if (state == 1) {
      return SliverList(
          delegate: SliverChildBuilderDelegate((_, index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: index == 0 ? 0 : 25),
          child: ReplyContainer(
            tweet: TweetModel(
                id: "12",
                userId: "12",
                user: User(
                    id: "11",
                    email: "email",
                    username: "dreamer",
                    createdAt: DateTime.now().toString()),
                body: "body tweets",
                createdAt: DateTime.now().toString()),
            theme: theme,
          ),
        );
      }, childCount: 50));
    } else if (state == 2) {
      return SliverList(delegate: SliverChildBuilderDelegate((_, index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: index == 0 ? 0 : 25),
          child: ReplyContainer(
            tweet: TweetModel(
                id: "12",
                userId: "12",
                user: User(
                    id: "11",
                    email: "email",
                    username: "dreamer",
                    createdAt: DateTime.now().toString()),
                body: "body replys",
                createdAt: DateTime.now().toString()),
            theme: theme,
          ),
        );
      }));
    } else if (state == 3) {
      return SliverList(delegate: SliverChildBuilderDelegate((_, index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: index == 0 ? 0 : 25),
          child: ReplyContainer(
            tweet: TweetModel(
                id: "12",
                userId: "12",
                user: User(
                    id: "11",
                    email: "email",
                    username: "dreamer",
                    createdAt: DateTime.now().toString()),
                body: "body likes",
                createdAt: DateTime.now().toString()),
            theme: theme,
          ),
        );
      }));
    } else {
      return Container();
    }
  }
}
