import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

@immutable
class Film {
  final String id;
  final String title;
  final String description;
  final bool isFavorite;

  const Film({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  Film copy({required bool isFavorite}) {
    return Film(
      id: id,
      title: title,
      description: description,
      isFavorite: isFavorite,
    );
  }

  @override
  String toString() => 'Film(id: $id, '
      'title: $title, '
      'description: $description, '
      'isFavorite: $isFavorite)';

  @override
  bool operator ==(covariant Film other) =>
      id == other.id && isFavorite == other.isFavorite;

  @override
  int get hashCode => Object.hashAll(
        [
          id,
          isFavorite,
        ],
      );
}

const allFilms = [
  Film(
    id: '1',
    title: 'The Shark',
    description: 'description shark',
    isFavorite: false,
  ),
  Film(
    id: '2',
    title: 'The dog',
    description: 'description dog',
    isFavorite: false,
  ),
  Film(
    id: '3',
    title: 'The Bird',
    description: 'description bird',
    isFavorite: false,
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('widget.title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
