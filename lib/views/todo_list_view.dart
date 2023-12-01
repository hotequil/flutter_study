import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/views/todo_list_item_view.dart';
import 'dart:developer';

import '../providers/todo_list_provider.dart';

class TodoListView extends ConsumerWidget{
  final todoInputController = TextEditingController();

  TodoListView({ super.key });

  void addTodoItem(String description, WidgetRef ref){
    description = description.trim();

    if(description.isEmpty) return;
    
    ref.read(todoListProvider.notifier).add(description);
    todoInputController.clear();
  }

  void removeTodoItem(String id, WidgetRef ref){
    ref.read(todoListProvider.notifier).remove(id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO list'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: todoInputController,
                      decoration: const InputDecoration(label: Text('Put a new description')),
                      onSubmitted: (value){
                        addTodoItem(value, ref);
                      },
                    )
                ),
                IconButton(
                    onPressed: (){
                      addTodoItem(todoInputController.text, ref);
                    },
                    icon: const Icon(Icons.add)
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  for(var index = 0; index < todos.length; index++)
                    Dismissible(
                      key: ValueKey(todos[index].id),
                      child: TodoListItemView(todo: todos[index], ref: ref),
                      onDismissed: (value){
                        log(value.toString());
                        removeTodoItem(todos[index].id, ref);
                      },
                    )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
