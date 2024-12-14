part of 'todo_bloc.dart';

 abstract class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;
    AddTodo(this.todo);
   @override
  List<Object> get props => [todo];
}
class UpdateTodo extends TodoEvent{
  final Todo UpdatedTodo;
  UpdateTodo(this.UpdatedTodo);
   @override
  List<Object> get props => [UpdateTodo];     
}
class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
    @override
  List<Object> get props => [id];
}
class EditTodo extends TodoEvent {
  final Todo updatedTodos;
  EditTodo(this.updatedTodos);
   @override
  List<Object> get props => [updatedTodos];
}