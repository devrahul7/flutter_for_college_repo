
import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/student_model.dart';

class MyCard extends StatelessWidget {
   MyCard({
    required this.student, required this.color,
    super.key,
  });
    final StudentModel student;
    var color;
    


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 16,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "First Name: ${student.fname}",
              style: TextStyle(fontSize: 24, color: Colors.grey.shade800),
            ),
            Text(
              "Last Name: ${student.lname}",
              style: TextStyle(fontSize: 24, color: Colors.grey.shade800),
            ),
            Text(
              "City: ${student.city}",
              style: TextStyle(fontSize: 24, color: Colors.grey.shade800),
            ),
          ],
        ),
      ),
    );
  }
}
