import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_library/repository/word_repo.dart';
import 'package:word_library/screens/home/home_screen.dart';
import 'package:word_library/screens/splash_screen.dart';


import 'bloc/dictionary_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        child: SplashScreen(),
        create: (context) => DictionaryCubit(WordRepository()),
      ),
    );
  }
}
