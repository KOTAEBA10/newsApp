import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/cubit/states.dart';

import '../network/dio_helper.dart';
import '../ui/business.dart';
import '../ui/science.dart';
import '../ui/sport.dart';


class NewsCubit extends Cubit<NewsStates> {

  NewsCubit():super (NewsInitialState());

  static NewsCubit get (context)=> BlocProvider.of(context);

  //---------BottomNavigationBar-----------------

  List<BottomNavigationBarItem> item = [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'sport'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'science'),
  ];

  int currentIndex = 0;

  onTap(int index){
    currentIndex=index;
    if(currentIndex==0){
      getBusiness();
    }else if(currentIndex==1){
      getSport();
    }else if(currentIndex==2){
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<Widget> body =[BusinessScreen(),SportScreen(),ScienceScreen()];

//---------BottomNavigationBar-----------------END

////---------GetData-----------------END

List<dynamic> business =[];

/*void getBusiness () {
  emit(NewsGetBusinessSuccessState());
  if(business.length==0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'bea4c8c6709d4ab998ac21217460ff16',
      }).then((value) {
        business = value.data['articles'];
        // print(business[0]['articles']['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error);
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    }else{
    emit(NewsGetBusinessSuccessState());
  }
  }*/
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if(business.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'business',
            'apiKey': 'bea4c8c6709d4ab998ac21217460ff16'
          }
      ).then((value) {
        business = value.data['articles'];
        // print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }
      ).catchError((error) {
        print(error);
        emit(NewsGetBusinessErrorState(error.toString()));

      }
      );
    }else{
      emit( NewsGetBusinessSuccessState());
    }

  }



  List<dynamic> sport =[];

  void getSport () {
    emit(NewsGetSportSuccessState());
    if(sport.length==0) {
      DioHelper.getData(
          url:'v2/top-headlines',
          query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'bea4c8c6709d4ab998ac21217460ff16',
      }).then((value) {
        sport = value.data['articles'];
      //  print(sport[0]['articles']['title']);
        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        print(error);
        emit(NewsGetSportErrorState(error.toString()));
      });
    }else{
      emit(NewsGetSportSuccessState());
    }
  }


  var science = [];

  void getScience (){
   if(science.length == 0) {
      DioHelper.getData(url:'v2/top-headlines',
          query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'bea4c8c6709d4ab998ac21217460ff16',
      }).then((value) {
        science = value.data['articles'];
        // print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error));
      });
    }else{
     emit(NewsGetScienceSuccessState());
   }
  }

  var search = [];

  void getSearch (String value){
    emit(NewsGetSearchLoadingState());
    search = [];

      DioHelper.getData(url:'v2/top-headlines',
          query: {
            'q': '$value',
            'apiKey': 'bea4c8c6709d4ab998ac21217460ff16',
          }).then((value) {
        search = value.data['articles'];
        // print(science[0]['title']);
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSearchErrorState(error));
      });
  }


  //--------Dark mode-------------------
  bool isDark=false;

  void changeMode(){
    isDark = !isDark;
    emit(ChangeModeState());
  }

}