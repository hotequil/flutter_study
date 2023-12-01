import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/notifiers/todo_list_notifier.dart';

import '../models/todo.dart';

final todoListProvider = NotifierProvider<TodoListNotifier, List<Todo>>(TodoListNotifier.new);
