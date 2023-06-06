import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../component/component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).sport;
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:(context,state){
        return  Scaffold(
          // appBar: AppBar(title:Text('Sport'),),
          body: listSep(list,context),
        );
      },
    );
  }
}
