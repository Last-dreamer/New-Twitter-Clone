

import 'package:flutter_bloc/flutter_bloc.dart';

class ShowPasswordCubit extends Cubit<bool> {
  ShowPasswordCubit():super(false);

  changeIcon(){
    emit(!state);
  }
}