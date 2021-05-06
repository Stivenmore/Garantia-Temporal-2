part of 'firebase_cubit.dart';

@immutable
abstract class FirebaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class FirebaseInitial extends FirebaseState {
  List<Object> get props => [];
}

class FirebaseLoaded extends FirebaseState {
  final List<Register> register;

  FirebaseLoaded({this.register});
  @override
  List<Object> get props => [register];
}

// ignore: must_be_immutable
class FirebaseError extends FirebaseState {
  String message;
  FirebaseError({this.message});
  @override
  List<Object> get props => [message];
}

// ignore: must_be_immutable
class FirebaseSnapbar extends FirebaseState {
  String snapbar;
  FirebaseSnapbar({this.snapbar});
  @override
  List<Object> get props => [snapbar];
}
