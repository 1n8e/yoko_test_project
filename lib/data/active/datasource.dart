import 'package:dio/dio.dart';
import 'package:yoko_test_project/models/acitve_model.dart';

class ActiveDataSource {
  final Dio dio;

  ActiveDataSource(this.dio);

  Future<List<Active>> fetchActive() async {
    Response response = await dio
        .get('/ticket-service/ticket-types/by-category-code/ACTIVITIES');

    return (response.data as List).map((e) => Active.fromJson(e)).toList();
  }
}
