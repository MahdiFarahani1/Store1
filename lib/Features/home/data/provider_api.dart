import 'package:dio/dio.dart';

class ProviderApi {
  getApi() async {
    var res = await Dio().get("https://alahwar-tv.com/api/news/category");
    return res;
  }
}
