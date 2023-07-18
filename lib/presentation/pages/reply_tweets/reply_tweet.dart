



import 'package:flutter/material.dart';
import 'package:twitter_clone/presentation/pages/tweet/widget/custom_widget.dart';

class ReplyTweetPage extends StatelessWidget {
  const ReplyTweetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text("tweets reply if any"),),
    );
  }
}