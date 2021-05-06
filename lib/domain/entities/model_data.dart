import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String name;
  final String lastname;
  final String date;
  final String direction;

  Register({
    this.name,
    this.lastname,
    this.date,
    this.direction,
  });
  factory Register.fromSQL(Map<String, dynamic> snapshot) => Register(
        name: snapshot['name'],
        lastname: snapshot['lastname'],
        date: snapshot['date'],
        direction: snapshot['direction'],
      );
  @override
  List<Object> get props => [name, lastname, date, direction];
}
