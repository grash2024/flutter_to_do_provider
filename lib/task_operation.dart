import 'package:flutter/material.dart';
import 'package:todo_provider/modals/task_list.dart';

class TaskOperation extends ChangeNotifier {
  List<TaskElements> tasks = [];
  void addToTaskList(String taskName) {
    tasks.add(TaskElements(taskName: taskName, checkState: false));
    notifyListeners();
  }

  void removeFromTaskList(index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void toggleState(index) {
    tasks[index].checkState = !tasks[index].checkState;
    notifyListeners();
  }
}
