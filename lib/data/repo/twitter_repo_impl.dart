import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:twitter_clone/data/data_source/graphql_service.dart';
import 'package:twitter_clone/data/model/twitter.dart';
import 'package:twitter_clone/domain/failure/failure.dart';
import 'package:twitter_clone/domain/repo/repo.dart';

class TwitterRepoImpl extends TwitterRepo {
  final TwitterRemoteDatasourcesImpl datasource;
  TwitterRepoImpl({required this.datasource});

  @override
  Future<Either<Failure, AuthResponse>> login(
      {String? email, String? password}) async {
    try {
      var res = await datasource.login(email: email, password: password);
      return Right(res);
    } on Exception catch (e) {
      return Left(GeneralFailure(err: e));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(
      {String? username,
      String? email,
      String? password,
      String? confirmPassword}) async {
    try {
      var res = await datasource.register(
          username: username,
          email: email,
          password: password,
          confirmPassword: confirmPassword);
      return Right(res);
    } catch (e) {
      return Left(GeneralFailure(err: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TweetModel>>> getTweets() async {
    try {
      var res = await datasource.getTweets();
      return Right(res);
    } on Exception catch (e) {
      return Left(GeneralFailure(err: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TweetModel>>> getReplyTweets({String? id}) async {
    try {
      var res = await datasource.getReplyTweets(parentId: id);
      log("testing res ${res}");
      return Right(res);
    } catch (e) {
      return Left(GeneralFailure(err: e.toString()));
    }
  }
}
