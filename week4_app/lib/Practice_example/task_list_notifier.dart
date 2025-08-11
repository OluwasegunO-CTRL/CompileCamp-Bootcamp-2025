import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week4_app/Practice_example/models.dart';

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>((ref){
  return TaskListNotifier();
});

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super([]);


  void addTask(Task task) {
    state = [...state, task];
  }

  void updateTask(String taskId, Task updatedTask) {
   state = [
      for(final task in state)
      if(task.id == taskId) updatedTask else task
    ];
  }

  void deleteTask(String taskId) {
    state = state.where((task) => task.id != taskId).toList();
  }

  void toggleCompletion(String taskId) {
    state = [
      for (final task in state)
      if (task.id == taskId)
      task.copyWith(isCompleted: !task.isCompleted)
      else task
    ];
  }
}