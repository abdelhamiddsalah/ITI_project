import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cocktail> cocktails = [];
  List<Cocktail> filteredCocktails = [];
  bool isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCocktails();
    _searchController.addListener(() {
      filterCocktails();
    });
  }

  Future<void> fetchCocktails() async {
    final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        cocktails = (data['drinks'] as List).map((drink) => Cocktail.fromJson(drink)).toList();
        filteredCocktails = cocktails;
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load cocktails');
    }
  }

  void filterCocktails() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCocktails = cocktails.where((cocktail) {
        return cocktail.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Cocktails',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: ListView.separated(
                key: ValueKey(filteredCocktails.length),
                itemCount: filteredCocktails.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(filteredCocktails[index].imageUrl),
                      radius: 30,
                    ),
                    title: Text(
                      filteredCocktails[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      filteredCocktails[index].instructions,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    tileColor: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Cocktail {
  final String name;
  final String instructions;
  final String imageUrl;

  Cocktail({required this.name, required this.instructions, required this.imageUrl});

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      name: json['strDrink'],
      instructions: json['strInstructions'],
      imageUrl: json['strDrinkThumb'],
    );
  }
}
