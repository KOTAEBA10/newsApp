
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/web_view.dart';

Widget buildArticleItem (list,context){
 return InkWell(
   onTap: (){
     navigateTo(context, WebViewScreen(list['url']));},
   child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:DecorationImage(
                image: NetworkImage(list['urlToImage']==null?'https://realsound.jp/wp-content/uploads/2020/08/rs-font-thumbnail_news_300.jpg':"${list['urlToImage']}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${list['title']}',style: Theme.of(context).textTheme.bodyText1,maxLines: 3,overflow: TextOverflow.ellipsis,),
                Text('${list['publishedAt']}',style: TextStyle(color: Colors.grey),),
              ],
            ),
          )
        ],
      ),
    ),
 );
}

Widget listSep(list ,context)=>  ListView.separated(
    physics:BouncingScrollPhysics() ,
  separatorBuilder: (context, index) {
    return Divider();
  },
  itemCount: list!.length,
  itemBuilder: (context, index) => list.length >0
      ? buildArticleItem(list[index],context)
      : Center(child: CircularProgressIndicator()),
);

void navigateTo (context,widget){
  Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return widget;
  }));
}