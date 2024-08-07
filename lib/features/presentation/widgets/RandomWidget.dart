import 'package:flutter/material.dart';
import 'package:iti_project/features/data/models/Random.dart';

class RandomWidget extends StatelessWidget {
   final List<Randomm> posts;
  const RandomWidget( {super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return 
          Container(
            padding: EdgeInsets.all(13),
            child: Column(
              children: [
                SizedBox(height: 40,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                ),
                   SizedBox(height: 30,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                     Text('Random')
                    ],
                   ),
                   SizedBox(height: 40,),
                Expanded(child: GridviewRandom()),
              ],
            ),
          );
      }

  ListView GridviewRandom() {
    return /*GridView.builder(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          mainAxisSpacing: 3,
           crossAxisSpacing: 7
           ),
           itemBuilder: (context, index){
             Randomm post = posts[index];
         return  
           ColumnRandom(post);
           },
          itemCount: posts.length,
       );*/
       ListView.builder(
          itemCount: posts.length,
        //  separatorBuilder: (context, index) => Divider(color: Colors.grey), // Custom separator with a grey color
          itemBuilder: (context, index) {
            Randomm post = posts[index];
            return  ColumnRandom(post);
            
          }
       );      
  }




  Column ColumnRandom(Randomm post) {
    return Column(
             children: [
              SizedBox(height: 8,),
             Image.network(post.image.toString(), width: 40,height: 40,fit: BoxFit.fill,),
             SizedBox(height: 8,),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.title.toString()),
                SizedBox(height: 8,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Text('price'),
                 Text(post.price.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
               ],
             ),
             SizedBox(height: 8,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Text('Category:'),
                 Text(post.category.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
               ],
             ),
             SizedBox(height: 8,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Text('rating:'),
                 Text(post.rating!.rate.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
               ],
             )
              ],
             )
             ],
           );
  }
  }
  