import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/dio.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/layout/cubit/states.dart';

class AppCubit extends Cubit<States> {
  AppCubit() : super(appInitStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int Index = 0;
  List<Widget> Screens = [Business(), Sports(), Science()];

  void changeIndex(int index) {
    Index = index;
    emit(changeIndexNow());
  }

  List business = [];
  List sports = [];
  List science = [];

  void getBusiness() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '21ec5da562414c9e9fb0525d87dbb2e6'
    })
        .then((value) => {
              business = value.data['articles'],
              print(business[0]['url']),
              emit(getBusinessState())
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  void getSports() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '21ec5da562414c9e9fb0525d87dbb2e6'
    })
        .then((value) => {
              sports = value.data['articles'],
              print(sports[0]['title']),
              emit(getSportsState())
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  void getScience() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '21ec5da562414c9e9fb0525d87dbb2e6'
    })
        .then((value) => {
              science = value.data['articles'],
              print(science[0]['title']),
              emit(getScienceState())
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }
}
