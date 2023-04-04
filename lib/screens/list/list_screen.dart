import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_library/model/word_response.dart';
import 'package:flutter/material.dart';

import '../../bloc/dictionary_cubit.dart';
import '../../repository/word_repo.dart';
import '../detail/detail_screen.dart';
import '../home/home_screen.dart';

class ListScreen extends StatelessWidget {
  final List<WordResponse> words;

  ListScreen(this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {    Navigator
            .of(context)
            .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
          return  BlocProvider(
            child: HomeScreen(),
            create: (context) => DictionaryCubit(WordRepository()),
          );
        })); },),),
      backgroundColor: Colors.black,
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            "${index + 1}. ${words[index].word}",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(words[index]),
              ),
            );
          },
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemCount: words.length,
      ),
    );
  }
}
