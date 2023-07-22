// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.back = false});

  final bool back;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      centerTitle: true,
      primary: true,
      shadowColor: theme.colorScheme.onPrimary.withAlpha(50),
      automaticallyImplyLeading: false,
      title: const Text("Home"),
      leading: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: back
              ? GestureDetector(
                  onTap: () {
                    context.router.pop();
                  },
                  child: const Icon(Icons.arrow_back),
                )
              : SvgPicture.asset(
                  "assets/round-flutter-dash.svg",
                  color: theme.colorScheme.secondary,
                )),
      actions: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1628260412297-a3377e45006f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2874&q=80"),
        ),
        Container(
          width: 10,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
