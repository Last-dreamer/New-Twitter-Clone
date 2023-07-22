import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/data/model/twitter.dart';
import 'package:twitter_clone/domain/use_cases/twitter_usecase.dart';

part 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  final TwitterUseCase useCase;
  RegisterCubit({required this.useCase}) : super(RegisterCubitInitial());

  register(
      {String? username,
      String? email,
      String? password,
      String? confirmPassword}) async {
    emit(RegisterCubitLoading());
    try {
      var res = await useCase.register(
          username: username,
          email: email,
          password: password,
          confirmPassword: confirmPassword);
      res.fold((l) => emit(RegisterCubitError(err: l.toString())),
          (r) => emit(RegisterCubitSuccess(response: r)));
    } catch (e) {
      emit(RegisterCubitError(err: e.toString()));
    }
  }
}
