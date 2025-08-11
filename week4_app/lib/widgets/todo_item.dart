// lib/widgets/todo_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week4_app/models/todo.dart';
import '../providers/todo_providers.dart';
import 'package:intl/intl.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({
    super.key, 
    required this.todo  
  });
  final Todo todo;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) {
            // Key concept: ref.read() for actions
            ref.read(todoListProvider.notifier).toggleTodo(todo.id);
          },
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted 
                ? TextDecoration.lineThrough 
                : TextDecoration.none,
            color: todo.isCompleted 
                ? Colors.grey 
                : null,
          ),
        ),
        subtitle: Text(DateFormat('MMM d, y hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(todo.id)))),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            ref.read(todoListProvider.notifier).deleteTodo(todo.id);
          },
        ),
      ),
    );
  }
}
