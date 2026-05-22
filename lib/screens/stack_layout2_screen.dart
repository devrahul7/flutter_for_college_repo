import 'package:flutter/material.dart';

class StackLayout2Screen extends StatelessWidget {
  const StackLayout2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Layout'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.amber,
            ),

            Positioned(
              top: 10,
              left: 10,
              bottom: 10,
              right: 10,
              child: Stack(
                children: [
                  Image.network(
                    'https://uttarakhandtourism.gov.in/assets/media/UTDB_media_1736324657Kedarnath(new).jpg',
                    height: 360,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            // ListTile(leading: const Icon(Icons.comment, color: Colors.black)),

            // ListTile(leading: const Icon(Icons.edit, color: Colors.purple)),
          ],
        ),
      ),
    );
  }
}
