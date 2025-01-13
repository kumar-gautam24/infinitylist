import 'package:infinitylist/api_service.dart';
import 'book_model.dart';

class BookRepo {
  static Future<List<Book>> getBooks(int quantity) async {
    print("in repo");
    var response = await ApiService().fetchBooks(quantity);
    print('Response: $response');
    print('Response Type: ${response.runtimeType}');
    return response!.map((e) => Book.fromJson(e)).toList();
  }
}
