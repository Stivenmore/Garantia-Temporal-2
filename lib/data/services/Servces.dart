import 'package:flutter/material.dart';

abstract class Services {
  void init();
  void dispones();
}

class ServiceResult<T> {
  @required
  bool status;

  T data;
  String message;
  String snapbar;

  ServiceResult({this.data, this.message, this.status, this.snapbar});
}
