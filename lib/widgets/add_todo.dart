import 'package:flutter/material.dart';
import 'package:todo_app/utils/buttons.dart';
import 'package:todo_app/utils/colors.dart';

class DialogBox extends StatelessWidget {
  // final Function(
  //   String,
  // ) onSave;
  // final Function(String, int) onedit;
  // int todoIndex;
  DialogBox({
    super.key,
    //  required this.onSave,
    // required this.onedit,
    // this.todoIndex = -1,
  });

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    return AlertDialog(
      backgroundColor: deepPurpleshadeColor,
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
             TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add discription"), 
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(
                  width: 5,
                ),
                MyButton(
                    text: "Save",
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
