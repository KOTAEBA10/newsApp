import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_news_app/ui/news_app_layout.dart';


import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'network/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=> NewsCubit()..getBusiness()..getSport()..getScience()),
        BlocProvider(create: (context)=>NewsCubit()),
      ],
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder:  (context,state)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              titleSpacing: 20.0,
              titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type:BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 0,
                selectedItemColor: Colors.teal,
                unselectedItemColor: Colors.grey
            ),
            textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
            ),
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('#206676'),
              appBarTheme: AppBarTheme(
                color: HexColor('#206676'),
                titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                centerTitle: true,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('#206676'),
                    statusBarIconBrightness: Brightness.light
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor:  HexColor('#206676'),
                selectedIconTheme: IconThemeData(color: Colors.white),
                elevation: 0,

              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )
              )
          ),
          themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
          home: NewsLayout(),
        ),

      ),
    );
  }
}
