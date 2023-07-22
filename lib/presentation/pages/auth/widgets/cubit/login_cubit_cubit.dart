import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/domain/use_cases/twitter_usecase.dart';

import '../../../../core/pref/pref.dart';
import 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final TwitterUseCase useCase;
  LoginCubit({required this.useCase}) : super(LoginCubitInitial());

  login({String? email, String? password}) async {
    emit(LoginCubitLoadingState());
    try {
      final res = await useCase.login(email: email, password: password);
      res.fold((l) => emit(LoginCubitErrorState(error: l)), (r) async {
        bool isSaved = await Pref.saveUser(r.user);
        if (isSaved) {
          emit(LoginCubitSuccessState(response: r));
        } else {
          emit(LoginCubitErrorState(error: "Model not saved in preferences.."));
        }
      });
    } catch (e) {
      emit(LoginCubitErrorState(error: e));
    }
  }
}
