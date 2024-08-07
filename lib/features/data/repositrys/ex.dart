import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchJewelryProducts() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products/category/jewelery');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load jewelry products');
    }
  }
}
