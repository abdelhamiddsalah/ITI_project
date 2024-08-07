import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/features/data/repositrys/Repos.dart';
import 'package:iti_project/features/presentation/cubit/cubit/ecomcubit_cubit.dart';
import 'package:iti_project/features/presentation/pages/RandomPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EcomcubitCubit(DioService()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: RandomPage(),

      ),
    );
  }
}
