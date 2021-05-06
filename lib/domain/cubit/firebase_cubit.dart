import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_y_sqflite/data/repository/Repository.dart';
import 'package:flutter_y_sqflite/data/services/Servces.dart';
import 'package:flutter_y_sqflite/domain/entities/model_data.dart';
import 'package:meta/meta.dart';

part 'firebase_state.dart';

class FirebaseCubit extends Cubit<FirebaseState> {
  final Repository _repository;

  FirebaseCubit({Repository repository})
      : _repository = repository ?? Repository(),
        super(FirebaseInitial());

  Future<void> setData({
    String name,
    String lastname,
    String date,
    List direction,
  }) async {
    emit(FirebaseInitial());
    ServiceResult result =
        await _repository.setDataforSQL(name, lastname, date, direction);
    if (result.status == true) {
      emit(FirebaseSnapbar(snapbar: result.snapbar));
      print('agregado con exito');
    } else {
      emit(FirebaseError(message: result.message));
      print('no agregado');
    }
  }
   Future<void> getDate() async {
    emit(FirebaseInitial());
    ServiceResult<List<Register>> result =
        await _repository.getDatafromSQL();
    if (result.data != null) {
      print('Loaded');
      emit(FirebaseLoaded(register: result.data));
    } else if (result.status == true) {
      print('SnackBar, no hay usuarios');
      emit(FirebaseSnapbar(snapbar: result.message));
    } else {
      print('Error');
      emit(FirebaseError(message: result.message));
    }
  }
}
