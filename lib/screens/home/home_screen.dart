import 'package:lottie/lottie.dart';
import 'package:word_library/bloc/dictionary_cubit.dart';
import 'package:word_library/screens/list/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formkey = GlobalKey<FormState>();
  getDictionaryFormWidget(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return Form(
      key: formkey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child:SingleChildScrollView(child: Column(
          children: [
            // Spacer(),
            Text(
              "Mobile Dictionary",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Search any word you want quickly",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            TextFormField(
              autofocus: false,
              validator: (value) => value!.isEmpty ? "Enter Search Word" : null,
              controller: cubit.queryController,
              decoration: InputDecoration(
                hintText: "Search a word",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                  borderSide: BorderSide(color: Colors.teal),
                ),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.teal,
                  ),
                  onPressed: () {
                    var form;
                    form = formkey.currentState;
                    if (form.validate()) {
                      form.save;
                      cubit.getWordSearched();
                    } else {}
                  },
                ),
                hintStyle: TextStyle(color: Colors.teal),
              ),
            ),
            // Spacer(),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Lottie.asset('assets/dictionary.json'),
                    SizedBox(
                      height: 25,
                    ),
                  ]),
                )),
          ],
        ),
        )
      ),
    );
  }

  getLoadingWidget() {
    return const Center(child: CircularProgressIndicator(
      backgroundColor: Colors.white,
      valueColor:  AlwaysStoppedAnimation<Color>(Colors.teal),));
  }

  getErrorWidget(message) {
    return Center(
        child: Text(
      message,
      style: TextStyle(color: Colors.teal),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return BlocListener(
      listener: (context, state) {
        if (state is WordSearchedState && state.words != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListScreen(state.words),
            ),
          );
        }
      },
      bloc: cubit,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            elevation: 0,
          ),
          backgroundColor: Colors.black,
          body: cubit.state is WordSearchingState
              ? getLoadingWidget()
              : cubit.state is ErrorState
                  ? getErrorWidget("Error")
                  : cubit.state is NoWordSearchedState
                      ? getDictionaryFormWidget(context)
                      : Container()),
    );
  }
}
