import 'package:flutter/material.dart';
import 'package:iti_project/features/data/repositrys/ex.dart';
// Adjust the import path as needed

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  final MealService _mealService = MealService();
  Map<String, dynamic>? _mealData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMeals();
  }

  Future<void> _fetchMeals() async {
    try {
      final data = await _mealService.fetchMeals('chicken');
      setState(() {
        _mealData = data;
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
        appBar: AppBar(title: Text('Meals')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_mealData == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Meals')),
        body: Center(child: Text('No data found')),
      );
    }

    return Scaffold(
      appBar:appbar() ,
      body: ListView.builder(
        itemCount: _mealData!['meals']?.length ?? 0,
        itemBuilder: (context, index) {
          final meal = _mealData!['meals'][index];
          return Column(children: [
                        //  TextFormField(),
                           const SizedBox(height: 8),
                          Image.network(meal['strMealThumb'], width: 40,height: 40,fit: BoxFit.fill,),
                            const SizedBox(height: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                    Text(meal['strMeal']),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Price:'),
                        Text(meal['strCategory'], style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                              ],
                            ),
          ]
          );
            //title: Text(meal['strMeal']),
            //subtitle: Text(meal['strCategory']),
           // leading: Image.network(meal['strMealThumb']),
          
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

