import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy_az/layout/news_app/cubit/cubit.dart';
import 'package:flutter_udemy_az/layout/news_app/cubit/states.dart';
import 'package:flutter_udemy_az/shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var list = NewsCubit.get(context).sports;
        return articlesBuilder(list, context);
      },
    );
  }
}
