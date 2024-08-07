import 'package:flutter/material.dart';
import 'package:iti_project/features/presentation/pages/FoodsPage.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return BlocProvider(
      create: (context) => EcomcubitCubit(DioService()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: RandomPage(),

      ),
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MealPage(),
>>>>>>> feb70eb403b5a1d0f69976b4900df8b398bedf1c
    );
  }
}
