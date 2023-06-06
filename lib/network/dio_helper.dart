
import 'package:dio/dio.dart';

class DioHelper{
  static Dio dio =new Dio();

  static init(){
    return dio = Dio(
        BaseOptions(

          baseUrl: 'https://newsapi.org/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> getData(
      {required String url,required /*Map<String,dynamic>*/dynamic query})
    async{
    return await dio.get(url,queryParameters: query);
  }


}