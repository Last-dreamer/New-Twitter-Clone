import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileHeaderCubit extends Cubit<bool> {
  ProfileHeaderCubit() : super(false);

  setValue(bool value) {
    emit(value);
  }
}
