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
                itemCount: _mealData!['meals']?.length ?? 0,
                itemBuilder: (context, index) {
                  final meal = _mealData!['meals'][index];
                  return Container(
                    padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                                     const SizedBox(height: 18),
                                    Image.network(meal['strMealThumb'], width: 80,height: 70,fit: BoxFit.fill,),
                                      const SizedBox(height: 18),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                              Text(meal['strMeal']),
                              const SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Price:'),
                                  Text(meal['strCategory'], style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Calory:'),
                                  Text(meal['strMeasure1'], style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                                        ],
                                      ),
                    ]
                    ),
                  );
                    //title: Text(meal['strMeal']),
                    //subtitle: Text(meal['strCategory']),
                   // leading: Image.network(meal['strMealThumb']),
                  
                },
              ),
            ),
          ],
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

