import 'package:flutter/material.dart';
import 'package:infinitylist/api_repo.dart';
import 'package:infinitylist/book_model.dart';

class ScrollScreen extends StatefulWidget {
  const ScrollScreen({super.key});

  @override
  State<ScrollScreen> createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Book> _books = [];
  int _quantity = 15;
  // bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _fetchBooks();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _quantity += 15;
      _fetchBooks();
    }
  }

  Future<void> _fetchBooks() async {
    // setState(() {
    //   _isLoading = true;
    // });

    List<Book> newBooks = await BookRepo.getBooks(_quantity);
    setState(() {
      _books.addAll(newBooks);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinity List'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_books[index].title),
            subtitle: Text(_books[index].author),
          );
        },
      ),
    );
  }
}
