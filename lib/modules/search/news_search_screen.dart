import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy_az/layout/news_app/cubit/cubit.dart';
import 'package:flutter_udemy_az/layout/news_app/cubit/states.dart';
import 'package:flutter_udemy_az/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value) {
                    NewsCubit.get(context).getSearch(value);
                    print(value);
                  },
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'must not by empty';
                    }
                    return null;
                  },
                  text: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(
                child: articlesBuilder(
                  list,
                  context,isSearch:true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
