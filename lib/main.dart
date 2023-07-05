import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/keys.dart';

void main() {
  runApp(const App());
}

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(0, 255, 0, 221));

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true,
          appBarTheme: const AppBarTheme().copyWith(
              color: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer),
          textTheme: const TextTheme().copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorScheme.onPrimary,
              fontSize: 23,
            ),
          )),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: const Keys(),
      ),
    );
  }
}
