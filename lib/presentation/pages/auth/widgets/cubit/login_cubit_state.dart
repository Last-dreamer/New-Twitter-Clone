// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:twitter_clone/data/model/twitter.dart';

@immutable
abstract class LoginCubitState  {}

class LoginCubitInitial extends LoginCubitState {}

class LoginCubitLoadingState extends LoginCubitState {}


class LoginCubitSuccessState extends LoginCubitState {
  final AuthResponse response;
  LoginCubitSuccessState({
    required this.response,
  });
  
}


class LoginCubitErrorState extends LoginCubitState {
  final dynamic error;
  LoginCubitErrorState({
    required this.error,
  });
}
