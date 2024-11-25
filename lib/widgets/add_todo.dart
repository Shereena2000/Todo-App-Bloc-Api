import 'package:flutter/material.dart';
import 'package:todo_app/data/data_model.dart';
import 'package:todo_app/services/todo_services.dart';
import 'package:todo_app/utils/buttons.dart';
import 'package:todo_app/utils/colors.dart';

class AddTodoBox extends StatelessWidget {
  // final Function(
  //   String,
  // ) onSave;
  // final Function(String, int) onedit;
  // int todoIndex;
  AddTodoBox({
    super.key,
    //  required this.onSave,
    // required this.onedit,
    // this.todoIndex = -1,
  });

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final discriptionController = TextEditingController();
    final TodoServices todoServices=TodoServices();
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
              controller: discriptionController,
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
                      final newTodo = Todo(
                          id: "",
                          title: titleController.text,
                          description: discriptionController.text,
                          isCompleted: false );
                          todoServices.CreateTodo(newTodo);
                    //  List<Todo>result= todoServices.FetchTodo();
                          titleController.clear();
                          discriptionController.clear();
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
