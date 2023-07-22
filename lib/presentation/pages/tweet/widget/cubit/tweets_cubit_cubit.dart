import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/data/model/twitter.dart';

import 'package:twitter_clone/domain/use_cases/twitter_usecase.dart';

part 'tweets_cubit_state.dart';

class TweetsCubit extends Cubit<TweetsCubitState> {
  final TwitterUseCase useCase;
  TweetsCubit({required this.useCase}) : super(TweetsCubitInitial());

  getTweets() async {
    emit(TweetsCubitInitial());
    try {
      var res = await useCase.getTweets();
      res.fold((l) => emit(TweetsCubitError(err: l.toString())),
          (r) => emit(TweetsCubitSuccess(tweets: r)));
    } catch (e) {
      emit(TweetsCubitError(err: e.toString()));
    }
  }
}
