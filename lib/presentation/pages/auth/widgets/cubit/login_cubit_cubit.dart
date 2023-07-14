
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/graph/graphql_service.dart';
import '../../../../../di.dart';
import 'login_cubit_state.dart';



class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitInitial());

  login({String? email, String? password})async{
    emit(LoginCubitLoadingState());
    try{

        var service = di<GraphqlService>();
        var res = await  service.login(email: email, password: password);
        if(res){
          emit(LoginCubitSuccessState());
        }else{
          emit(LoginCubitErrorState(error: "Something wrong with calling the api from graph server"));
        }
    }catch (e){
      emit(LoginCubitErrorState(error: e.toString()));
    }

  }
}
