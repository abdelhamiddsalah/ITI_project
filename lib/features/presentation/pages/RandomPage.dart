import 'package:flutter/material.dart';
import 'package:iti_project/features/data/models/Jew_model.dart';
import 'package:iti_project/features/data/models/Random.dart';
import 'package:iti_project/features/data/repositrys/ex.dart';



class Randompage extends StatefulWidget {
  @override
  _RandompageState createState() => _RandompageState();
}

class _RandompageState extends State<Randompage> {
  late Future<List<Random>> _futureProducts;
  final ApiService2 _apiService = ApiService2();

  @override
  void initState() {
    super.initState();
    _futureProducts = _fetchProducts();
  }

  Future<List<Random>> _fetchProducts() async {
    final productsData = await _apiService.fetchJewelryProducts();
    return productsData.map<Random>((json) => Random.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: FutureBuilder<List<Random>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found'));
          } else {
            final products = snapshot.data!;
            return Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(

              ),
              
              child: Column(
                children: [
                   SizedBox(height: 30,),
                  Image.asset('assets/images/Mask Group.png', width: 140,height: 130,),
                  SizedBox(height: 30,),
                  TextFormField(
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
           const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('Random'),
            ],
          ),
          SizedBox(height: 30,),
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                       final product = products[index];
                        return Column(children: [
                        //  TextFormField(),
                           const SizedBox(height: 13),
                            Image.network(
                              product.image.toString(),
                              width: 80,
                              height: 70,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(height: 18),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                    Text(product.title.toString()),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Price:'),
                        Text(product.price.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 18,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('rating:'),
                        Text(product.rating.rate.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                              ],
                            ),
                        ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
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

