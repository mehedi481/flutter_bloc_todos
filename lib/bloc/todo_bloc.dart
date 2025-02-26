import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todos/todo_model.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<LoadTodos>(_loadTodos);
    on<AddTodo>(_addTodo);
  }

  void _loadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(
      TodoLoaded([
        Todo(title: "Todo 1"),
        Todo(title: "Todo 2"),
        Todo(title: "Todo 3"),
      ]),
    );
  }

  void _addTodo(AddTodo event, Emitter<TodoState> emit) async {
    if (state is TodoLoaded) {
      final List<Todo> updatedTodos = List.from((state as TodoLoaded).todos)
        ..add(Todo(title: event.title));

      emit(TodoLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(TodoLoaded(updatedTodos));
    }
  }

  @override
  void onTransition(Transition<TodoEvent, TodoState> transition) {
    print(transition);
    super.onTransition(transition);
  }
}
