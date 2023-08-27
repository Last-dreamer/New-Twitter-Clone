// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit_cubit.dart';

abstract class RegisterCubitState extends Equatable {
  const RegisterCubitState();

  @override
  List<Object> get props => [];
}

class RegisterCubitInitial extends RegisterCubitState {}

class RegisterCubitLoading extends RegisterCubitState {}

class RegisterCubitSuccess extends RegisterCubitState {
  final AuthResponse response;
  const RegisterCubitSuccess({
    required this.response,
  });
}

class RegisterCubitError extends RegisterCubitState {
  final String err;
  const RegisterCubitError({
    required this.err,
  });
}
