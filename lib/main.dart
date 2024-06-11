import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_demo/api_service/api_service.dart';
import 'package:pagination_demo/home/home_ui.dart';
import 'package:pagination_demo/logic/cubit/news_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pagination Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            NewsCubit(ApiService(baseUrl: 'https://newsapi.org')),
        child: const ItemListScreen(),
      ),
    );
  }
}
