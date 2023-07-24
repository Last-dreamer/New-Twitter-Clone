import 'package:flutter_bloc/flutter_bloc.dart';

class TabIndexCubit extends Cubit<int> {
  TabIndexCubit() : super(1);

  setIndex(int value) {
    emit(value);
  }
}
