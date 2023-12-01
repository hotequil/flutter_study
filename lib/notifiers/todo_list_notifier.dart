import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/models/todo.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class TodoListNotifier extends Notifier<List<Todo>>{
  @override
  List<Todo> build() => [];

  void add(String description){
    state = [...state, Todo(id: uuid.v4(), description: description)];
  }

  void toggle(String id){
    state = [
      for(var index = 0; index < state.length; index++)
        if(state[index].id == id)
          Todo(
            id: state[index].id,
            description: state[index].description,
            completed: !state[index].completed
          )
        else state[index]
    ];
  }

  void remove(String id){
    state = state.where((element) => element.id != id).toList();
  }
}
