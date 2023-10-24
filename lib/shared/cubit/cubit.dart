import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy_az/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:flutter_udemy_az/modules/done_tasks/done_tasks_screen.dart';
import 'package:flutter_udemy_az/modules/new_tasks/new_tasks_screen.dart';
import 'package:flutter_udemy_az/shared/cubit/states.dart';
import 'package:flutter_udemy_az/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());



  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarStates() as AppChangeModeStates);
  }

  bool isBottomSheetShow = false;
  IconData fabIcon = Icons.edit;

  changeBottomSheet({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShow = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetStates() as AppChangeModeStates);
  }

  late Database database;

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT, time TEXT,date TEXT, status TEXT)')
            .then(
          (value) {
            print('table creating');
          },
        ).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDateFromDatabase(database);
        print('opened database');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseStates() as AppChangeModeStates);
    });
  }

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO tasks(title ,time, date, status) VALUES("$title","$time","$date","new")')
          .then((value) {
        print('$value Insert successfully');
        getDateFromDatabase(database);
        emit(AppInsertToDatabaseStates() as AppChangeModeStates);
      }).catchError((error) {
        print('Error Whe Inserting New Record error ${error.toString()}');
      });
    });
  }

  void getDateFromDatabase(database) {
    emit(AppGetDatabaseLoadingStates() as AppChangeModeStates);
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    return database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else
          archivedTasks.add(element);

        // print(element['status']);
      });
      emit(AppGetDatabaseStates() as AppChangeModeStates);
      print(value);
    });
  }

  void updateDate({
    required String status,
    required int id,
  }) async {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getDateFromDatabase(database);
      emit(AppUpdateDatabaseStates() as AppChangeModeStates);
    });
  }

  void deleteDate({required int id,}) async {
    await database
        .rawDelete('DELETE FROM tasks  WHERE id = ?', [id]).then((value) {
      getDateFromDatabase(database);
      emit(AppDeleteDatabaseStates() as AppChangeModeStates);
    });
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared})
  {
    if (fromShared != null)
      {
        isDark = fromShared;
        emit(AppChangeModeStates());
      }

    else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeStates());
      });
    }

  }

}

