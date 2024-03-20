import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/view/movie_list_screen/movie_list_screen.dart';

import 'view/movie_detail_screen/bloc/movie_detail_cubit.dart';
import 'view/movie_list_screen/bloc/movie_list_cubit.dart';

void main() {
  runApp(  MultiBlocProvider(
    providers: [
      BlocProvider<MovieListCubit>(
        create: (BuildContext context) => MovieListCubit(),
      ),
      BlocProvider<MovieDetailCubit>(
        create: (BuildContext context) => MovieDetailCubit(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieApp(),
    );
  }
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MovieListScreen(),
    );
  }
}

