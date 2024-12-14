import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/data/data_model.dart';
import 'package:todo_app/utils/buttons.dart';
import 'package:todo_app/utils/colors.dart';

class AddTodoBox extends StatelessWidget {
  final Todo? todo;

  AddTodoBox({
    super.key,
    this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final discriptionController = TextEditingController();

    if (todo?.id != null) {
      titleController.text = todo!.title;
      discriptionController.text = todo!.description;
    }

    return AlertDialog(
      backgroundColor: deepPurpleshadeColor,
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      todo?.title == null ? "Add a new task" : todo!.title),
            ),
            TextField(
              controller: discriptionController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: todo?.description == null
                      ? "Add discription"
                      : todo!.description),
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
                      if (todo != null) {
                        final updatedTodo = Todo(
                            id: todo!.id,
                            title: titleController.text,
                            description: discriptionController.text,
                            isCompleted: todo!.isCompleted);
                        context.read<TodoBloc>().add(EditTodo(updatedTodo));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Todo Edited Successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        final newTodo = Todo(
                            id: DateTime.now()
                                .microsecondsSinceEpoch
                                .toString(),
                            title: titleController.text,
                            description: discriptionController.text,
                            isCompleted: false);
                        context.read<TodoBloc>().add(AddTodo(newTodo));
                        print("----------CLICKLED- SAVE--------");
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Todo Added Successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }

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
