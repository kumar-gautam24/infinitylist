import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

   fetchBooks(int quantity) async {
    try {
      final response = await _dio.get(
        'https://fakerapi.it/api/v2/books',
        queryParameters: {'_quantity': quantity},
      );

      if (response.statusCode == 200) {
        print('Status: ${response.data['status']}');
        print('Code: ${response.data['code']}');
        print('Total: ${response.data['total']}');
        print('Data: ${response.data['data']}');
        return response.data['data'];
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
