import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/providers/todo_list_provider.dart';

import '../models/todo.dart';

class TodoListItemView extends StatelessWidget{
  final Todo todo;
  final WidgetRef ref;

  const TodoListItemView({
    super.key,
    required this.todo,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.description),
      leading: Checkbox(
        key: ValueKey(todo.id),
        value: todo.completed,
        onChanged: (value){
          ref.read(todoListProvider.notifier).toggle(todo.id);
        },
      )
    );
  }
}
