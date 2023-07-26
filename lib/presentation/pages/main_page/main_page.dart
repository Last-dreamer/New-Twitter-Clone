// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:twitter_clone/presentation/core/routes/router.gr.dart';

import '../add_or_reply_tweet.dart/add_reply_tweet.dart';
import '../common/bottom_nav/bottom_nav_bar.dart';
import '../common/show_modal_bottom_sheet.dart';

class GuestMainPage extends StatelessWidget {
  const GuestMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: AutoRouter(
        placeholder: (context) {
          return const Scaffold(
            backgroundColor: Color(0xff000000),
          );
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  TabsRouter? tabsRouter;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      homeIndex: 0,
      routes: const [GuestMainRoute(), ProfileRoute()],
      builder: (context, child, anim) {
        tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: OpenContainer(
              transitionType: ContainerTransitionType.fadeThrough,
              transitionDuration: const Duration(milliseconds: 500),
              useRootNavigator: false,
              closedColor: Theme.of(context).colorScheme.secondary,
              closedShape: const CircleBorder(),
              closedElevation: 8,
              closedBuilder: (BuildContext context, void Function() action) {
                return FloatingActionButton(
                    elevation: 0,
                    onPressed: null,
                    child: SvgPicture.asset(
                      "assets/feather.svg",
                      color: Colors.black,
                    ));
              },
              openBuilder: (BuildContext context,
                  void Function({Object? returnValue}) action) {
                return const AddReplyTweetPage(text: "Add Tweet");
              },
            ),
            bottomNavigationBar: LampBottomNavigationBar(
              items: const [Icons.home_outlined, Icons.person_2_outlined],
              width: double.infinity,
              onTap: (index) {
                tabsRouter!.setActiveIndex(index);
              },
              currentIndex: tabsRouter!.activeIndex,
            ),
            body: PageTransitionSwitcher(
                reverse: true,
                transitionBuilder: (Widget child,
                    Animation<double> primaryAnimation,
                    Animation<double> secondaryAnimation) {
                  return FadeThroughTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: child));
      },
    );
  }
}
