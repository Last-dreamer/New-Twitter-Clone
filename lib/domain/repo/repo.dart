import 'package:dartz/dartz.dart';

import '../../data/model/twitter.dart';
import '../failure/failure.dart';

abstract class TwitterRepo {
  Future<Either<Failure, AuthResponse>> login(
      {String? email, String? password});
  Future<Either<Failure, AuthResponse>> register(
      {String? username,
      String? email,
      String? password,
      String? confirmPassword});
  Future<Either<Failure, List<TweetModel>>> getTweets();
  Future<Either<Failure, List<TweetModel>>> getReplyTweets({String? id});
}
