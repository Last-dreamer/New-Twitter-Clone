
import 'package:flutter/material.dart';

@immutable
abstract class LoginCubitState  {}

class LoginCubitInitial extends LoginCubitState {}

class LoginCubitLoadingState extends LoginCubitState {}


class LoginCubitSuccessState extends LoginCubitState {}


class LoginCubitErrorState extends LoginCubitState {
  final String error;
  LoginCubitErrorState({
    required this.error,
  });
}
