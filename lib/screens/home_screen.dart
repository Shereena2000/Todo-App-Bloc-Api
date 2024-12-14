import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/todo_tile.dart';
import 'package:todo_app/widgets/add_todo.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Todo")),
          foregroundColor: whiteColor,
          backgroundColor: deepPurpleColor,
        ),
        body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return TodoTile(
                  todo: todo,
                );
              },
            );
          } else if (state is TodoError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: Text('No todos Found'),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AddTodoBox();
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
