import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_library/model/word_response.dart';
import 'package:flutter/material.dart';

import '../../bloc/dictionary_cubit.dart';
import '../../repository/word_repo.dart';
import '../home/home_screen.dart';

class DetailScreen extends StatelessWidget {
  final WordResponse wordResponse;

  DetailScreen(this.wordResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "${wordResponse.word}",
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final meaning = wordResponse.meanings[index];
                  // final audio = wordResponse.phonetics[index].audio;
                  final definations = meaning.definitions;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meaning.partOfSpeech,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListView.separated(
                        itemBuilder: (context, index) => Column(
                          children: [
                            Text(
                              "Defination : " + definations[index].definition!,
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            definations[index].example != null
                                ? Text(
                                    "Sentence  : ${definations[index].example}",
                                    style: TextStyle(color: Colors.teal),
                                  )
                                : Text(''),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 8,
                        ),
                        itemCount: definations.length,
                        shrinkWrap: true,
                      )
                    ],
                  );
                },
                itemCount: wordResponse.meanings.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 32,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
