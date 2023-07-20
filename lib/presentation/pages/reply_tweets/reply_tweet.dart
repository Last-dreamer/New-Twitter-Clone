// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:twitter_clone/data/model/twitter.dart';
import 'package:twitter_clone/presentation/pages/reply_tweets/widget/cubit/reply_tweets_cubit.dart';
import 'package:twitter_clone/presentation/pages/tweet/widget/custom_widget.dart';

import '../common/show_modal_bottom_sheet.dart';

class ReplyTweetPage extends StatefulWidget {
  const ReplyTweetPage({
    Key? key,
    required this.tweet,
  }) : super(key: key);
  final TweetModel tweet;

  @override
  State<ReplyTweetPage> createState() => _ReplyTweetPageState();
}

class _ReplyTweetPageState extends State<ReplyTweetPage> {
  @override
  void initState() {
    super.initState();
    context.read<ReplyTweetsCubit>().getReplyTweets(id: widget.tweet.id);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var width = size.width;
    var theme = Theme.of(context);

    return Scaffold(
        appBar: const CustomAppBar(back: true),
        body: SingleChildScrollView(
          child: BlocConsumer<ReplyTweetsCubit, ReplyTweetsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ReplyTweetsLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.colorScheme.secondary,
                  ),
                );
              }
              if (state is ReplyTweetsSuccess) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header(width, theme),
                      gap(),
                      body(theme),
                      gap(),
                      dateAndFormate(theme),
                      gap(),
                      line(width, theme),
                      gap(),
                      views_section(theme),
                      gap(),
                      line(width, theme),
                      gap(),
                      commentSection(size, theme),
                      gap(),
                      line(width, theme),
                      gap(),
                      replys(theme, state.list)
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ));
  }

  ListView replys(ThemeData theme, List<TweetModel> list) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ReplyContainer(theme: theme, tweet: list[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return gap();
      },
    );
  }

  Container commentSection(Size width, ThemeData theme) {
    return Container(
      width: width.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => showSheet(
                context, theme, width.width, width.height, "Tweet Reply"),
            child: const Icon(Icons.comment),
          ),
          const Icon(Icons.loop_rounded),
          Icon(Icons.favorite, color: theme.colorScheme.secondary),
          const Icon(Icons.share_outlined),
        ],
      ),
    );
  }

  RichText views_section(ThemeData theme) {
    return RichText(
        text: TextSpan(text: "", children: [
      TextSpan(text: "12 ", style: theme.textTheme.bodyLarge),
      TextSpan(text: "Retweets ", style: theme.textTheme.bodyMedium),
      const TextSpan(text: "   "),
      TextSpan(text: "110 ", style: theme.textTheme.bodyLarge),
      TextSpan(text: "likes ", style: theme.textTheme.bodyMedium),
      const TextSpan(text: "   "),
      TextSpan(text: "11 ", style: theme.textTheme.bodyLarge),
      TextSpan(text: "Bookmarks ", style: theme.textTheme.bodyMedium),
    ]));
  }

  Widget dateAndFormate(ThemeData theme) {
    return Row(
      children: [
        RichText(
          text: TextSpan(text: "", children: [
            TextSpan(
              text:
                  "${DateTime.parse(widget.tweet.createdAt).hour.toString()} : ${DateTime.parse(widget.tweet.createdAt).minute.toString()} ${DateTime.parse(widget.tweet.createdAt).hour > 12 ? "PM" : "AM"} - ${DateFormat.yMMMd().format(DateTime.now())}",
              style: theme.textTheme.labelLarge,
            ),
            const TextSpan(text: "  •  "),
            TextSpan(text: "100 ", style: theme.textTheme.titleMedium),
            const TextSpan(text: "Views "),
          ]),
        ),
      ],
    );
  }

  SizedBox gap() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget body(ThemeData theme) {
    return RichText(
      text: TextSpan(text: widget.tweet.body, style: theme.textTheme.bodyLarge),
    );
  }

  Row header(double width, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: width * .08,
              backgroundImage: const NetworkImage(
                  "https://images.unsplash.com/photo-1628260412297-a3377e45006f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2874"),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.tweet.user.username,
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                  "@${widget.tweet.user.username}",
                  style: theme.textTheme.bodySmall,
                )
              ],
            )
          ],
        ),
        const Icon(Icons.more_horiz)
      ],
    );
  }
}

class ReplyContainer extends StatelessWidget {
  const ReplyContainer({
    super.key,
    required this.theme,
    required this.tweet,
  });

  final ThemeData theme;
  final TweetModel tweet;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
              child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1628260412297-a3377e45006f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2874&q=80"),
          )),
          Expanded(
              flex: 5,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    firstSection(theme, tweet.user.username, tweet.createdAt),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                          text: tweet.body, style: theme.textTheme.bodyLarge),
                    ),
                    Container(
                      height: 20,
                    ),
                    lastSection(size, theme),
                  ],
                ),
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
        Text(
          name,
          style: theme.textTheme.bodyMedium,
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
