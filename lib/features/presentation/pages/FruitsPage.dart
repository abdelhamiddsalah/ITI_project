/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/features/data/repositrys/Repos.dart';
import 'package:iti_project/features/presentation/cubit/cubit/ecomcubit_cubit.dart';

class FruitsPage extends StatelessWidget {
  const FruitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => EcomcubitCubit(DioService()),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataCubit = context.read<EcomcubitCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Fetching with Cubit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            BlocBuilder<EcomcubitCubit, DataState>(
              builder: (context, state) {
                if (state is DataLoading) {
                  return CircularProgressIndicator();
                } else if (state is DataLoaded) {
                  return Text(state.data.toString());
                } else if (state is DataError) {
                  return Text(state.message);
                } else {
                  return Text('Press the button to fetch data');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}*/
