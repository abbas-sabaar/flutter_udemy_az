import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy_az/modules/counter/cubit/cubit.dart';
import 'package:flutter_udemy_az/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (BuildContext context, states)
        {
          if(states is CounterMinusStates  )
          {
            // print('minus state ${states.counter} ');
          }

          if(states is CounterPlusStates  )
          {
            // print('plus state ${states.counter} ');
          }

        },
        builder: (BuildContext context, states) {
          var cubit = CounterCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {

                     cubit.minus();
                    },
                    child: Text('MINUS',style: TextStyle(fontSize: 25),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      '${cubit.counter}',
                      style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {


                      cubit.plus();
                    },
                    child: Text('PLUS',style: TextStyle(fontSize: 25),),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
