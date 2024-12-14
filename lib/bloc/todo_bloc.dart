import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/data_model.dart';
import 'package:todo_app/services/todo_services.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoServices todoServices;
  TodoBloc(this.todoServices) : super(TodoInitial()) {
    on<FetchTodos>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await todoServices.FetchTodo();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError('Failed to load Todos'));
      }
    });

    on<AddTodo>(
      (event, emit) async {
        print('Adding new todo: ${event.todo.title}');
        if (state is TodoLoaded) {
          try {
            await todoServices.CreateTodo(event.todo);

            final todos = await todoServices.FetchTodo();

            emit(TodoLoaded(todos));

            print('New Todo added and list updated.');
          } catch (e) {
            emit(TodoError('Failed to add Todo'));

            print('Error adding Todo: $e');
          }
        }
      },
    );

    on<UpdateTodo>((event, emit) async {
      if (state is TodoLoaded) {
        try {
          await todoServices.UpdatedTodo(event.UpdatedTodo);
          final todos = await todoServices.FetchTodo();
          emit(TodoLoaded(todos));
        } catch (e) {
          emit(TodoError('Failed to update Todo'));
        }
      }
    });

    on<DeleteTodo>(
      (event, emit) async {
        if (state is TodoLoaded) {
          try {
            await todoServices.DeleteTodo(event.id);
            final todos = await todoServices.FetchTodo();
            emit(TodoLoaded(todos));
          } catch (e) {
            emit(TodoError('Failed to delete Todo'));
          }
        }
      },
    );

    on<EditTodo>(
      (event, emit) async {
        if (state is TodoLoaded) {
          try {
            await todoServices.UpdatedTodo(event.updatedTodos);
            final todos = await todoServices.FetchTodo();
            emit(TodoLoaded(todos));
          } catch (e) {
            emit(TodoError('failed to edit Todo'));
          }
        }
      },
    );
  }
}
