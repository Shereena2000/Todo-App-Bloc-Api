import 'package:flutter/material.dart';
import 'package:todo_app/data/data_model.dart';
import 'package:todo_app/utils/colors.dart';

class ShowDetails extends StatelessWidget {
  const ShowDetails({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(backgroundColor: deepPurpleColor,
      title: Text(
        todo.title,
        style: const TextStyle(fontWeight: FontWeight.bold,color: whiteColor),
      ),
      content: Text(
        style:const TextStyle(color: whiteColor),
        todo.description.isNotEmpty
            ? todo.description
            : "No description available.",
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Close",style: TextStyle(color: whiteColor),),
        ),
      ],
    );
  }
}
