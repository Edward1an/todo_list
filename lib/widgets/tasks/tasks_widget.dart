import 'package:flutter/material.dart';
import 'package:todo_list/widgets/tasks/tasks_widget_model.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  TasksWidgetModel? _model;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_model == null) {
      final groupKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = TasksWidgetModel(groupKey: groupKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = _model;
    if (model != null) {
      return TasksWidgetModelProvider(
          model: model, child: const TaskWidgetBody());
    } else {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
  }
}

class TaskWidgetBody extends StatelessWidget {
  const TaskWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = TasksWidgetModelProvider.watch(context)?.model;
    final taskName = model?.group?.name;
    return Scaffold(
      appBar: AppBar(title: Text('$taskName' '`s task')),
      body: const TaskWidgetBodyList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model?.showForm(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskWidgetBodyList extends StatelessWidget {
  const TaskWidgetBodyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksCount =
        TasksWidgetModelProvider.watch(context)?.model.tasks.length ?? 0;
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return const SizedBox(
            height: 50,
            child: Center(
              child: Text('cdds'),
            ));
      },
      itemCount: tasksCount,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
        );
      },
    );
  }
}
