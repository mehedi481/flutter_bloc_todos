part of 'todo_bloc.dart';

sealed class TodoState {}

class TodoInitial extends TodoState {
  TodoInitial();
}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);
}
