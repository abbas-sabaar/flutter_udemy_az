import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy_az/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitialStates()) ;
  static CounterCubit get(context)=> BlocProvider.of(context);

  int counter = 0 ;
  void minus (){
    counter -- ;
    emit(CounterMinusStates(counter));

  }

  void plus (){
    counter ++ ;
    emit(CounterPlusStates(counter));

  }
}