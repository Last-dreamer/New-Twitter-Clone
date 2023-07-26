import 'package:animations/animations.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:twitter_clone/presentation/pages/tweet/widget/cubit/tweets_cubit_cubit.dart';
import 'package:twitter_clone/presentation/pages/tweet/widget/custom_widget.dart';
import 'package:twitter_clone/presentation/pages/tweet/widget/tweet_container.dart';

import '../common/widgets/snack_bar.dart';

class TweetsPage extends StatefulWidget {
  const TweetsPage({super.key});

  @override
  State<TweetsPage> createState() => _TweetsPageState();
}

class _TweetsPageState extends State<TweetsPage> {
  var armOffset = 80.0;

  @override
  void initState() {
    super.initState();
    context.read<TweetsCubit>().getTweets();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var width = size.width;
    var height = size.height;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: CustomRefreshIndicator(
        offsetToArmed: armOffset,
        builder: (BuildContext context, Widget child,
            IndicatorController controller) {
          return AnimatedBuilder(
            animation: controller,
            child: child,
            builder: (context, child) {
              return Stack(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: armOffset * controller.value,
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              theme.colorScheme.secondary, BlendMode.srcIn),
                          child: Lottie.asset("assets/icons8 twitter.json",
                              repeat: true))),
                  Transform.translate(
                      offset: Offset(0.0, armOffset * controller.value),
                      child: controller.isLoading
                          ? const CircularProgressIndicator()
                          : child),
                ],
              );
            },
          );
        },
        onRefresh: () async {
          context.read<TweetsCubit>().getTweets();
          return Future.delayed(const Duration(seconds: 1));
        },
        child: ListView(
          children: [
            Container(height: 20),
            BlocConsumer<TweetsCubit, TweetsCubitState>(
              listener: (context, state) {
                if (state is TweetsCubitError) {
                  CustomSnackBar(
                          error: true,
                          text: "Error: ${state.err}",
                          context: context)
                      .showSnackbar();
                }
              },
              builder: (context, state) {
                if (state is TweetsCubitError) {
                  return Text(
                    state.err,
                    style: const TextStyle(color: Colors.red),
                  );
                }
                if (state is TweetsCubitSuccess) {
                  return SizedBox(
                    width: width,
                    height: height,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TweetContainer(tweet: state.tweets[index]);
                      },
                      itemCount: state.tweets.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
