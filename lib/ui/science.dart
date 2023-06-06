import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).science;
    return BlocConsumer<NewsCubit,NewsStates>(
        listener:(context,state){},
        builder: (context,state)=> Scaffold(
          body: listSep(list,context) ,
        )
    );
  }
}
