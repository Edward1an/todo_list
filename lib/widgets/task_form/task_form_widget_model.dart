import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/widgets/domain/entity/group.dart';
import 'package:todo_list/widgets/domain/entity/task.dart';

class TaskFormWidgetModel {
  int groupKey;
  var tasktext = '';
  TaskFormWidgetModel({required this.groupKey});
  void saveTasks(BuildContext context) async {
    if (tasktext.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(TaskAdapter());
    }
    final task = Task(text: tasktext, isDone: false);
    final taskBox = await Hive.openBox<Task>('tasks_box');
    await taskBox.add(task);
    final groupBox = await Hive.openBox<Group>('group_box');
    final group = groupBox.get(groupKey);
    group?.addTask(taskBox, task);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
}

class TaskFormWidgetModelProvider extends InheritedWidget {
  final TaskFormWidgetModel model;
  const TaskFormWidgetModelProvider(
      {super.key, required this.model, required Widget child})
      : super(child: child);

  static TaskFormWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TaskFormWidgetModelProvider>();
  }

  static TaskFormWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TaskFormWidgetModelProvider>()
        ?.widget;
    return widget is TaskFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(TaskFormWidgetModelProvider oldWidget) {
    return false;
  }
}
