import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:twitter_clone/data/model/twitter.dart';
import 'package:twitter_clone/presentation/pages/reply_tweets/reply_tweet.dart';

class TweetContainer extends StatelessWidget {
  const TweetContainer({super.key, required this.tweet});

  final TweetModel tweet;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
              child: Hero(
            tag: "img-",
            child: Material(
              color: Colors.transparent,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1628260412297-a3377e45006f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2874&q=80"),
              ),
            ),
          )),
          Expanded(
              flex: 5,
              child: OpenContainer(
                transitionType: ContainerTransitionType.fadeThrough,
                transitionDuration: const Duration(milliseconds: 500),
                closedColor: theme.colorScheme.primary,
                openColor: theme.colorScheme.primary,
                closedElevation: 4,
                closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                closedBuilder: (context, action) {
                  return Container(
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        boxShadow: [
                          BoxShadow(
                              color: theme.colorScheme.onPrimary.withAlpha(80),
                              offset: const Offset(1, 2),
                              blurRadius: 10.0,
                              spreadRadius: 2.0)
                        ]),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        firstSection(
                            theme, tweet.user.username, tweet.createdAt),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                              text: tweet.body,
                              style: theme.textTheme.bodyLarge),
                        ),
                        Container(
                          height: 20,
                        ),
                        lastSection(width, theme),
                      ],
                    ),
                  );
                },
                openBuilder: (BuildContext context,
                    void Function({Object? returnValue}) action) {
                  return ReplyTweetPage(tweet: tweet);
                },
              )),
        ],
      ),
    );
  }

  Container lastSection(Size width, ThemeData theme) {
    return Container(
      width: width.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.comment_outlined,
                size: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "1",
                style: theme.textTheme.bodyLarge,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.loop_rounded,
                size: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "15",
                style: theme.textTheme.bodyLarge,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.favorite,
                  size: 18, color: theme.colorScheme.secondary),
              const SizedBox(
                width: 5,
              ),
              Text(
                "100",
                style: theme.textTheme.bodyLarge,
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.share_outlined,
                size: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row firstSection(ThemeData theme, String name, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Hero(
          tag: "txt-$name",
          child: Material(
            color: Colors.transparent,
            child: Text(
              name,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.timer_outlined,
              size: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(timeago.format(DateTime.parse(date)))
          ],
        )
      ],
    );
  }
}
