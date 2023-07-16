// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:equatable/equatable.dart';

abstract class Failure with EquatableMixin{}


class ServerFailure extends Failure {
   @override
  List<Object?> get props => [];
}

class MissingFieldsException extends Failure {
  
  @override  
  List<Object?> get props =>[];
}

class GeneralFailure extends Failure {
  final dynamic err;
  GeneralFailure({
    required this.err,
  });
   @override
  List<Object?> get props => [err];
}



