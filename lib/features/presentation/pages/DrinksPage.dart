import 'package:flutter/material.dart';
import 'package:iti_project/features/data/repositrys/Api.dart';
// Adjust the import path as needed

class DrinkPage extends StatefulWidget {
  @override
  _DrinkPageState createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  final DrinkService _drinkService = DrinkService();
  Map<String, dynamic>? _drinkData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchdrinks();
  }

  Future<void> _fetchdrinks() async {
    try {
      final data = await _drinkService.fetchdrinks('margarita');
      setState(() {
        _drinkData = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error, e.g., show a message
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Drinks')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_drinkData == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Meals')),
        body: Center(child: Text('No data found')),
      );
    }

    return Scaffold(
      appBar:appbar() ,
      body: Container(
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
                Text('Drinks'),
              ],
            ),
            SizedBox(height: 18,),
            Expanded(
              child: ListView.builder(
                itemCount: _drinkData!['drinks']?.length ?? 0,
                itemBuilder: (context, index) {
                  final drink = _drinkData!['drinks'][index];
                  return Container(
                    padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                                     const SizedBox(height: 18),
                                    Image.network(drink['strDrinkThumb'], width: 80,height: 70,fit: BoxFit.fill,),
                                      const SizedBox(height: 18),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                             // Text(drink!['strTags']),
                              const SizedBox(height: 18),
                              Rowdrink1(drink),
                               Rowdrink2(drink),
                                        ],
                                      ),
                    ]
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row Rowdrink2(drink) {
    return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Calory:'),
                                Text(drink['strMeasure1'], style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            );
  }

  Row Rowdrink1(drink) {
    return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('title:'),
                                Text(drink['strDrink'], style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
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

