import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/di.dart';
import 'package:twitter_clone/presentation/pages/tweet/widget/cubit/tweets_cubit_cubit.dart';
import 'package:twitter_clone/presentation/pages/tweet/widget/custom_widget.dart';
import 'package:twitter_clone/presentation/pages/tweet/widget/tweet_container.dart';

class TweetPage extends StatefulWidget {
  const TweetPage({super.key});

  @override
  State<TweetPage> createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
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

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
           Container(height: 20,
                    ),
            BlocConsumer<TweetsCubit, TweetsCubitState>(
              listener: (context, state) {
                if(state is TweetsCubitError){
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${state.err}"), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating,));
                }
              },
              builder: (context, state) {
                 if(state is TweetsCubitError) {
                  return Text(state.err, style: const TextStyle(color: Colors.red),);
                 }
                 if(state is TweetsCubitSuccess) {
                  log("testing state 222 ${state.tweets.length}");
                    return SizedBox(
                  width: width,
                  height: height,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return   TweetContainer(text: state.tweets[index].body,);
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
