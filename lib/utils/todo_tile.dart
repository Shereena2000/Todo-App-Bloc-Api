import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/data/data_model.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/widgets/add_todo.dart';
import 'package:todo_app/widgets/show_details.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todo,
  });
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return ShowDetails(todo: todo);
            },
          );
        },
        child: Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              onPressed: (context) {
                context.read<TodoBloc>().add(DeleteTodo(todo.id));
              },
              icon: Icons.delete,
              foregroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
            )
          ]),
          child: Container(
            decoration: BoxDecoration(
                color: deepPurpleColor, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Checkbox(
                    value: todo.isCompleted,
                    onChanged: (bool? value) {
                      final updatedTodo =
                          todo.copyWith(isCompleted: value ?? false);
                      context.read<TodoBloc>().add(UpdateTodo(updatedTodo));
                    },
                    activeColor: whiteColor,
                    checkColor: blackColor,
                    side: const BorderSide(color: whiteColor),
                  ),
                  Text(
                    todo.title,
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: whiteColor,
                        decorationThickness: 2),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AddTodoBox(
                            todo: todo,
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
