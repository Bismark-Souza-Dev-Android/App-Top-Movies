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
  MoviesList? movies;

  Future <void> _getListApi() async {
    await Future.delayed(Duration(seconds: 5));
    http.get(
      Uri.https('api.themoviedb.org', '4/list/1'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYmYzMzA1OGZlYTkwZmU2MmVjMDRjNzY5MzUwZjI5MyIsInN1YiI6IjYzNmQ4MThiMDQ5OWYyMDA3ZmViNTg2ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.56OIf4q5ZnPEfXHa_niANV1iz4L3LfcTf5iS3arwbhM'
      },
    ).then((Response value) {
      if (value.statusCode == 200) {
        movies = MoviesList.fromJson(
          jsonDecode(value.body),
        );
        print(movies.toString());
        setState(() {

        });
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Text('Movie: ${movies?.name ?? 'Erro'}'),
        ),
      ),
    );
  }
}
