import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 3,
        children: [
          


          for (int i = 1; i < 10; i++) ...{
            Container(
              alignment: Alignment.center,
              color: i % 2 == 0 ? Colors.yellow : Colors.green,
              // color: Colors.amber,
              child: 
              TextButton(onPressed: () {}, child:  Text('$i',
                
                style: TextStyle(fontSize: 50, color: Colors.black)
                )
              ,
              ),
            ),
          },
        ],
      ),
    );
  }
}
