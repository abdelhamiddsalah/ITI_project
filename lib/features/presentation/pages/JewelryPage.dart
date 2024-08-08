import 'package:flutter/material.dart';
import 'package:iti_project/features/data/models/Jew_model.dart';
import 'package:iti_project/features/data/repositrys/Api.dart';



class JewelryPage extends StatefulWidget {
  @override
  _JewelryPageState createState() => _JewelryPageState();
}
/////////
class _JewelryPageState extends State<JewelryPage> {
  late Future<List<Jewe>> _futureProducts;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureProducts = _fetchProducts();
  }

  Future<List<Jewe>> _fetchProducts() async {
    final productsData = await _apiService.fetchJewelryProducts();
    return productsData.map<Jewe>((json) => Jewe.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: FutureBuilder<List<Jewe>>(
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
              Text('Jewelry'),
            ],
          ),
          SizedBox(height: 30,),
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                       final product = products[index];
                        return Column(children: [
                           const SizedBox(height: 8),
                            Image.network(
                              product.image.toString(),
                              width: 80,
                              height: 70,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(height:13),
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
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('rating:'),
                        Text('4.6', style: const TextStyle(fontWeight: FontWeight.bold)),
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

