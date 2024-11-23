import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/todo_tile.dart';
import 'package:todo_app/widgets/add_todo.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
List todoList = [
  ['1st one', false],
  ['2nd one', false],
  ['3rd one', false],
  ['4th one', false],
];


    
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Todo")),
          foregroundColor: whiteColor,
          backgroundColor: deepPurpleColor,
        ),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: todoList[index][0],
                taskCompleted: todoList[index][1],
               
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
      
           showDialog(
        context: context,
        builder: (context) {
          return  DialogBox( );
        });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
   

}

