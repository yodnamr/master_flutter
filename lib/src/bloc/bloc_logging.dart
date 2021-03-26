
import 'package:flutter_bloc/flutter_bloc.dart';

class BloCLogging extends BlocObserver{
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }
}