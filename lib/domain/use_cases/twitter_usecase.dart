




import 'package:dartz/dartz.dart';
import 'package:twitter_clone/data/model/twitter.dart';
import 'package:twitter_clone/domain/failure/failure.dart';
import 'package:twitter_clone/domain/repo/repo.dart';

class TwitterUseCase {
  final TwitterRepo twitterRepo;
  TwitterUseCase({required this.twitterRepo});
  
  Future<Either<Failure, AuthResponse>> login({String? email, String? password}) async {
    return twitterRepo.login(email: email, password: password);
  }

  Future<Either<Failure, AuthResponse>> register({String? username, String? email, String? password, String? confirmPassword})async{
    return twitterRepo.register(username: username, email: email, password: password, confirmPassword: confirmPassword);
  }
  
}