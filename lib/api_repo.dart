import 'package:infinitylist/api_service.dart';

import 'book_model.dart';

class BookRepo {
  Future<List<Book>> getBooks(int quantity) {
    var response = ApiService().fetchBooks(quantity);
    print(response.runtimeType);
    return response.then((value) {
      List<Book> books = [];
      for (var item in value) {
        books.add(Book.fromJson(item));
      }
      return books;
    });
  }
}
