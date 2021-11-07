import 'package:riverpod/riverpod.dart';

class MyData extends StateNotifier<double> {
  MyData() : super(0.5);
  void changState(newState) => this.state = newState;
  
  double getState(){
    return this.state;
  }
}