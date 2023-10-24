import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy_az/shared/components/components.dart';
import 'package:flutter_udemy_az/shared/cubit/cubit.dart';
import 'package:flutter_udemy_az/shared/cubit/states.dart';

class ArchivedTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var tasks = AppCubit.get(context).archivedTasks;
        return tasksBuilderItme(
          tasks: tasks,
        );
      },
    );
  }
}

