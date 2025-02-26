part of 'todo_bloc.dart';

sealed class TodoEvent {}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;

  AddTodo(this.title);
}