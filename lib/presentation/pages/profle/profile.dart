import 'package:flutter/material.dart';
import 'package:twitter_clone/presentation/pages/profle/widget/profile_appbar.dart';
import 'package:twitter_clone/presentation/pages/profle/widget/sticky_header.dart';

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
    var height = size.height;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        profileAppBar(width, image),
        SliverPersistentHeader(
          delegate: StickyHeader(height: 250),
          pinned: true,
          floating: true,
        ),

        SliverList(
            delegate: SliverChildBuilderDelegate((_, index) {
          return Container(
            color: Colors.red,
            height: 10,
          );
        }, childCount: 500)),
        // StickyHeader(height: 200),
      ],
    );
  }
}
