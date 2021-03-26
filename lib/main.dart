import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stock/src/app.dart';
import 'package:my_stock/src/bloc/bloc_logging.dart';

void main() {
  Bloc.observer = BloCLogging();
  runApp(App());
}
