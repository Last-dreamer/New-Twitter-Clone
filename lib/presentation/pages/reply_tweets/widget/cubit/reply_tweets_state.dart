// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reply_tweets_cubit.dart';

abstract class ReplyTweetsState extends Equatable {
  const ReplyTweetsState();

  @override
  List<Object> get props => [];
}

class ReplyTweetsInitial extends ReplyTweetsState {}

class ReplyTweetsLoading extends ReplyTweetsState {}

class ReplyTweetsSuccess extends ReplyTweetsState {
  final List<TweetModel> list;
  const ReplyTweetsSuccess({
    required this.list,
  });
  @override
  List<Object> get props => [list];
}

class ReplyTweetsError extends ReplyTweetsState {
  final dynamic err;
  const ReplyTweetsError({
    required this.err,
  });
}
