# Mobile Dictionary

This is a dictionary application using block state management .The application uses an api service to get the result of the user search query or the user search word .In order to search for a word you call the dictionary api [https://dictionaryapi.dev/]


## Author

Name :Lilian Kamau
Github link [https://github.com/lilianjerikamau/Mobile-Dictionary]

# Technologies

Flutter, Dart, bloc state management,Free Dictionary API

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/lilianjerikamau/Mobile-Dictionary.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

### Libraries & Tools Used

* [http](https://pub.dev/packages/http)
* [Flutter Bloc](https://pub.dev/packages/flutter_bloc) (State Management)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- bloc/
|- model/
|- repository/
|- screens/
|- service/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- bloc -
2- model -
3- repository -
4- screens -
5- service -
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### bloc

All the business logic of your application will go into this directory, it represents the data layer of your application. It is sub-divided into three directories `local`, `network` and `sharedperf`, each containing the domain specific logic. Since each layer exists independently, that makes it easier to unit test. The communication between UI and data layer is handled by using central repository.

```
bloc/
  |- dictionary_cubit.dart
    


```

### model

The store is where all your application state lives in flutter. The Store is basically a widget that stands at the top of the widget tree and passes it's data down using special methods. In-case of multiple stores, a separate folder for each store is created as shown in the example below:

```
model/
  |- word_response.dart
    
```

### repository

The store is where all your application state lives in flutter. The Store is basically a widget that stands at the top of the widget tree and passes it's data down using special methods. In-case of multiple stores, a separate folder for each store is created as shown in the example below:

```
repository/
  |- word_response.dart

```
### screens

This directory contains all the ui of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in `widgets` directory as shown in the example below:

```
screens/
|- detail
   |- detail_screen.dart
|- home
   |- home_screen.dart
|- list
   |- list_screen.dart
```

### service

Contains the common file(s) and utilities used in a project. The folder structure is as follows:

```
service/
  |- http_service.dart
```


### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
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

```

## Dependencies
```pubspec.yaml
  cupertino_icons: ^1.0.2
  flutter_bloc: ^7.0.0
  http: ^0.13.1
  lottie: ^1.1.0
  sqflite: ^2.0.3+1
  path_provider: ^2.0.11
```


## License

```
MIT License

Copyright (c) 2022 Vijay R

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.