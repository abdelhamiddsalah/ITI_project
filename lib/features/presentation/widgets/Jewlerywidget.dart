import 'package:flutter/material.dart';
import 'package:iti_project/features/data/models/Jew_model.dart';

class JewelryWidget extends StatelessWidget {
  final List<Jewe> products;

  const JewelryWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      child: Column(
        children: [
          const SizedBox(height: 40),
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
          const SizedBox(height: 40),
          Expanded(child: _buildPostsList()),
        ],
      ),
    );
  }

  ListView _buildPostsList() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        Jewe post = products[index];
        return _buildPostItem(post);
      },
    );
  }

  Column _buildPostItem(Jewe post) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Image.network(
          post.image.toString(),
          width: 40,
          height: 40,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title.toString()),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Price:'),
                Text(post.price.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
