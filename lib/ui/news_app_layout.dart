import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/ui/search.dart';


import '../component/component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) { },
      builder: (BuildContext context, Object? state) {
        var cubit = NewsCubit.get(context);
        return  Scaffold(

         /* floatingActionButton: FloatingActionButton(
            onPressed: (){
              DioHelper.getData(
                  url:'v2/top-headlines',
                  query:{
                'country':'eg',
                'category':'business',
                'apiKey': 'bea4c8c6709d4ab998ac21217460ff16'
              }).then((value) => print(value.data['articles'][0]['title']));
            },
          ),*/
          appBar: AppBar(title: Text('News App'),
            actions: [
              IconButton(onPressed: (){navigateTo(context,SearchScreen());}, icon: Icon(Icons.search)),
              IconButton(onPressed: (){NewsCubit.get(context).changeMode();}, icon: Icon(Icons.dark_mode)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items:cubit.item ,
           currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.onTap(index);
            },
          ),
          body: cubit.body[cubit.currentIndex],
        );
      },

    );
  }
}
