import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

showSheet(BuildContext context, theme, width, height, text,
    AnimationController controller, Animation animation) async {
  return showModalBottomSheet(
      useRootNavigator: true,
      clipBehavior: Clip.none,
      elevation: 10,
      isScrollControlled: true,
      backgroundColor: theme.colorScheme.primaryContainer,
      context: context,
      builder: (context) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return FractionallySizedBox(
              heightFactor: animation.value,
              child: child,
            );
          },
          child: SizedBox(
            width: width,
            height: height,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * .04,
                  vertical: MediaQuery.sizeOf(context).width * .1),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => context.router.pop(),
                          child: const Icon(Icons.arrow_back_ios)),
                      Expanded(
                        flex: 5,
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  gap(),

                  line(width, theme),
                  line(width, theme),
                  gap(),
                  gap(),
                  gap(),
                  // const Spacer(),
                  SizedBox(
                    // height: 500,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: width * .08,
                              backgroundImage: const NetworkImage(
                                  "https://images.unsplash.com/photo-1628260412297-a3377e45006f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2874"),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                                child: TextFormField(
                                  maxLines: 10,
                                  cursorColor:
                                      Theme.of(context).colorScheme.secondary,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  decoration: const InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: "What's in your mind ?",
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      border: InputBorder.none),

                                  // decoration: ,
                                ),
                              ),
                            )
                          ],
                        ),
                        // const Spacer(),
                        gap(),
                        gap(),

                        MaterialButton(
                          height: MediaQuery.sizeOf(context).width * .15,
                          minWidth: MediaQuery.sizeOf(context).width,
                          color: Theme.of(context).colorScheme.secondary,
                          shape: const StadiumBorder(),
                          onPressed: () {},
                          child: Text(
                            text,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    // color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

SizedBox gap() {
  return const SizedBox(
    height: 20,
  );
}

SizedBox lessGap() {
  return const SizedBox(
    height: 10,
  );
}

SizedBox lessWidthGap() {
  return const SizedBox(
    width: 10,
  );
}

Container line(double width, ThemeData theme) {
  return Container(
    height: .1,
    width: width,
    decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.secondary),
        borderRadius: BorderRadius.circular(10),
        color: theme.colorScheme.secondary),
  );
}
