import 'package:flutter/material.dart';
import 'package:todo_list/widgets/group_form/group_form_widget.dart';
import 'package:todo_list/widgets/task_form/task_form_widget.dart';
import 'package:todo_list/widgets/tasks/tasks_widget.dart';

import '../groups/groups_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/groups', routes: {
      '/groups': (context) => const GroupsWidget(),
      '/groups/form': (context) => const GroupsFormWidget(),
      '/groups/tasks': (context) => const TaskWidget(),
      '/groups/tasks/form': (context) => const TaskFormWidget(),
    });
  }
}
