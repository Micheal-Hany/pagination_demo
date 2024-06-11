// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:pagination_demo/models/news_model/news_model.dart';

class ApiService {
  final String baseUrl;
  final Dio dio;

  ApiService({required this.baseUrl})
      : dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<NewsModel> fetchSources({int page = 1}) async {
    final response =
        await dio.get('/v2/top-headlines/sources', queryParameters: {
      'apiKey': '51675b1670c44890945d88b96a94a727',
      'page': page,
    });

    if (response.statusCode == 200) {
      return NewsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load sources');
    }
  }
}
