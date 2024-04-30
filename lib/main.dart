import 'dart:convert';
import 'package:first_app/movies_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void _getListApi() {
    http.get(
      Uri.https('api.themoviedb.org', '4/list/1'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYmYzMzA1OGZlYTkwZmU2MmVjMDRjNzY5MzUwZjI5MyIsInN1YiI6IjYzNmQ4MThiMDQ5OWYyMDA3ZmViNTg2ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.56OIf4q5ZnPEfXHa_niANV1iz4L3LfcTf5iS3arwbhM'
      },
    ).then((Response value) {
      if (value.statusCode == 200) {
        MoviesList movies = MoviesList.fromJson(
          jsonDecode(value.body),
        );
        print(movies);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getListApi();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
