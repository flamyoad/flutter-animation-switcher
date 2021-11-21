import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview_animation/home_page_cubit.dart';
import 'package:listview_animation/presentation/bloc/list_cubit.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => HomePageCubit()),
          BlocProvider(create: (_) => ListCubit()),
        ],
        child: MyHomePage(),
      ),
    );
  }
}
