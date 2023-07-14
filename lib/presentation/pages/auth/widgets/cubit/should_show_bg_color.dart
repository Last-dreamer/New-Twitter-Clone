


import 'package:flutter_bloc/flutter_bloc.dart';

class ShouldShowBdColor extends Cubit<int> {
  ShouldShowBdColor():super(0);

  changeBackgroundColor(int value){
    emit(value);
  }
}