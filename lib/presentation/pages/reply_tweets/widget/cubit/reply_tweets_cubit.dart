import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:twitter_clone/data/model/twitter.dart';
import 'package:twitter_clone/domain/use_cases/twitter_usecase.dart';

part 'reply_tweets_state.dart';

class ReplyTweetsCubit extends Cubit<ReplyTweetsState> {
  final TwitterUseCase useCase;
  ReplyTweetsCubit({required this.useCase}) : super(ReplyTweetsInitial());

  getReplyTweets({String? id}) async {
    try {
      emit(ReplyTweetsLoading());

      var res = await useCase.getReplyTweets(id: id);

      log("testing cubit ${res}");

      res.fold((l) => emit(ReplyTweetsError(err: l)),
          (r) => emit(ReplyTweetsSuccess(list: r)));
    } catch (e) {
      emit(ReplyTweetsError(err: e));
    }
  }
}
