import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/student_model.dart';

class OutputScreen extends StatelessWidget {
  const OutputScreen({super.key, required this.lstStudents});

  final List<StudentModel> lstStudents;

  // Data store garne thau  banune
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Output Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: lstStudents.isEmpty
          ? const Text(
              'No students added yet.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lstStudents.length,
              itemBuilder: (context, index) {
                final student = lstStudents[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(child: Text(student.fname[0])),
                    title: Text('${student.fname} ${student.lname}'),
                    subtitle: Text(student.city),
                  ),
                );
              },
            ),
            
    );
  }
}