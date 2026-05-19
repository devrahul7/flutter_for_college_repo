import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/student_model.dart';
import 'package:flutter_for_college/widgets/my_card_widgets.dart';

class CardViewScreen extends StatelessWidget {
  const CardViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<StudentModel> students = [
      StudentModel(fname: "rahul", lname: "Shah", city: "rajdevi"),
      StudentModel(fname: "ram", lname: "Shah", city: "chitwan"),
      StudentModel(fname: "sita", lname: "Shah", city: "nepal"),
      StudentModel(fname: "sharuk", lname: "khan", city: "nepal"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('CardView'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return MyCard(
            student: student,
            color: index % 2 == 0 ? Colors.yellow : Colors.green,
          );
        },
      ),
    );
  }
}
