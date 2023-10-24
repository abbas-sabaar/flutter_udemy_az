import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy_az/layout/news_app/cubit/states.dart';
import 'package:flutter_udemy_az/modules/business/business_screen.dart';
import 'package:flutter_udemy_az/modules/sports/sports_screen.dart';
import 'package:flutter_udemy_az/modules/technology/technology_screen.dart';
import 'package:flutter_udemy_az/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());


  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) getBusiness();
    if (index == 1) getTechnology();
    if (index == 2) getSports();
    emit(NewsBottomNavBarStates());
  }

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.android_outlined,
      ),
      label: 'Technology',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    TechnologyScreen(),
    SportsScreen(),
  ];

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingStates() as NewsBottomNavBarStates);
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'dbc06a8a43044e2397982881f5388160',
    }).then((value) {

      // business = value!.data['articles'];
      // print(value?.data.toString());
      emit(NewsGetBusinessSuccessStates() as NewsBottomNavBarStates);
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorStates(error) as NewsBottomNavBarStates);
    });
  }

  List<dynamic> technology = [];
  void getTechnology() {
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'technology',
      'apiKey': 'dbc06a8a43044e2397982881f5388160',
    }).then((value) {
      technology = value.data['articles'];
      print(value.data.toString());
      emit(NewsGetTechnologySuccessStates());
    }).catchError(
      (error) {
        emit(NewsGetTechnologyErrorStates(error));
        print(error.toString());
      },
    );
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingStates() );
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': 'dbc06a8a43044e2397982881f5388160',
    }).then((value) {
      sports = value.data['articles'];
      print(value.data.toString());
      emit(NewsGetSportsSuccessStates());
    }).catchError(
      (error) {
        print(error.toString());
        emit(NewsGetSportsErrorStates(error) );
      },
    );
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingStates() as NewsBottomNavBarStates);
    DioHelper.getDate(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'dbc06a8a43044e2397982881f5388160',
    }).then((value) {
      search = value.data['articles'];
      print(value.data.toString());
      emit(NewsGetSearchSuccessStates());
    }).catchError(
      (error) {
        print(error.toString());
        emit(
          NewsGetSearchErrorStates(error),
        );
      },
    );
  }


}

