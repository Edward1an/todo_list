import 'package:flutter/widgets.dart';

class GroupsFormWidgetModel {}

class GroupsFormWidgetModelProvider extends InheritedWidget {
  final GroupsFormWidgetModel model;
  const GroupsFormWidgetModelProvider( {super.key, required this.model,  required this.child})
      : super(child: child);


  final Widget child;

  static GroupsFormWidgetModelProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupsFormWidgetModelProvider>();
  }

  @override
  bool updateShouldNotify(GroupsFormWidgetModelProvider oldWidget) {
    return true;
  }
}
