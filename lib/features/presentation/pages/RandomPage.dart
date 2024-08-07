/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/features/presentation/cubit/cubit/ecomcubit_cubit.dart';
import 'package:iti_project/features/presentation/widgets/RandomWidget.dart';


class RandomPage extends StatelessWidget {
  const RandomPage({super.key});

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: appbar(),
      body: SafeArea(
        child:
         BlocConsumer<EcomCubit,EcomCubitState>(
          listener: (context, state) {

            if(state is EcomCubitFailure) {
              SnackBar snackBar = SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

          },
          builder: (context, state) {

            if(state is EcomCubitLoading) {
              return  const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is EcomCubitRandomSuccess) {
              return 
              RandomWidget(posts: state.randomPosts);
            }

            return const Center(
              child: Text("An error occured!"),
            );

          },
        ),
      ),
    );
  }
}
AppBar appbar() {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
      title: const Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Menofia, Egypt",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
*/