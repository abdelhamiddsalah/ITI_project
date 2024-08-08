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




class ApiService2 {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchJewelryProducts() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load jewelry products');
    }
  }
}


class MealService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchMeals(String query) async {
    try {
      final response = await _dio.get(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=chicken',
        queryParameters: {'s': query},
      );
      return response.data;
    } catch (e) {
      print('Error fetching meals: $e');
      throw Exception('Failed to load meals');
    }
  }
}
