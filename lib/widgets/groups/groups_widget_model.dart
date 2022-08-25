import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/widgets/domain/entity/group.dart';

class GroupsWidgetModel extends ChangeNotifier {
  var _groups = <Group>[];

  List<Group> get groups => _groups.toList();
  void showFrom(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  GroupsWidgetModel() {
    _setup();
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('group_box');
    _groups = box.values.toList();
    notifyListeners();
    box.listenable().addListener(() {
      _groups = box.values.toList();
      notifyListeners();
    });
  }

  void deleteGroup(int groupIndex) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('group_box');
    await box.deleteAt(groupIndex);
  }
}

class GroupsWidgetModelProvider extends InheritedNotifier {
  final GroupsWidgetModel model;
  const GroupsWidgetModelProvider(
      {super.key, required this.model, required this.child})
      : super(child: child, notifier: model);

  @override
  final Widget child;

  static GroupsWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupsWidgetModelProvider>();
  }

  static GroupsWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupsWidgetModelProvider>()
        ?.widget;
    return widget is GroupsWidgetModelProvider ? widget : null;
  }
}
