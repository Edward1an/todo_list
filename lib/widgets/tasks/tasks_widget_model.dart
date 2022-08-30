import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/widgets/domain/entity/group.dart';

class TasksWidgetModel extends ChangeNotifier {
  int groupKey;
  late final Future<Box<Group>> _groupBox;

  Group? _group;
  Group? get group => _group;

  TasksWidgetModel({required this.groupKey}) {
    _setup();
  }
  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/tasks/form');
  }

  void loadGroup() async {
    final box = await _groupBox;
    _group = box.get(groupKey);
    notifyListeners();
  }

  Future<void> _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    _groupBox = Hive.openBox<Group>('group_box');
    loadGroup();
  }
}

class TasksWidgetModelProvider extends InheritedNotifier {
  final TasksWidgetModel model;
  const TasksWidgetModelProvider(
      {super.key, required this.model, required Widget child})
      : super(child: child, notifier: model);

  static TasksWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TasksWidgetModelProvider>();
  }

  static TasksWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TasksWidgetModelProvider>()
        ?.widget;
    return widget is TasksWidgetModelProvider ? widget : null;
  }
}
