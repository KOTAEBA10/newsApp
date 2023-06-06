import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).search;
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder:(context,state){
          return Scaffold(
            appBar: AppBar(title: Text('Search'),),
            body:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType:TextInputType.text ,
                    controller:searchController ,
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search'
                    ),
                  ),
                ),
                Expanded(child: listSep(list, context)),
              ],
            ) ,
          );
    },
    );
  }
}
