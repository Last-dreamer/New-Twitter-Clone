// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tweets_cubit_cubit.dart';

abstract class TweetsCubitState extends Equatable {
  const TweetsCubitState();

  @override
  List<Object> get props => [];
}

class TweetsCubitInitial extends TweetsCubitState {}


class TweetsCubitLoading extends TweetsCubitState {}


class TweetsCubitSuccess extends TweetsCubitState {
  final List<TweetModel> tweets;
  const TweetsCubitSuccess({
    required this.tweets,
  });

@override
  List<Object> get props => [tweets];
}



class TweetsCubitError extends TweetsCubitState {
  final String err;
const  TweetsCubitError({
    required this.err,
  });
}

