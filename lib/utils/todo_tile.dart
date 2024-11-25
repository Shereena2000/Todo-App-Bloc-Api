import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/widgets/add_todo.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    // required this.onChanged,
    // required this.deleteFunction,
    // this.editFunction,
  });

  final String taskName;
  final bool taskCompleted;
  // final Function(bool?)? onChanged;
  // final Function(BuildContext)? deleteFunction;
  // final Function()? editFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) {},
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
                // Checkbox(
                //   value: taskCompleted,
                //   onChanged: onChanged,
                //   activeColor: whiteColor,
                //   checkColor: deepPurpleColor,
                //   side: const BorderSide(color: whiteColor),
                // ),
                IconButton(
              icon: Icon(color: whiteColor,taskCompleted ? Icons.check_box : Icons.check_box_outline_blank),
              onPressed: (){},
            ),
                Text(
                  taskName,
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 18,
                      decoration: taskCompleted
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
                        return AddTodoBox();
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
    );
  }
}
