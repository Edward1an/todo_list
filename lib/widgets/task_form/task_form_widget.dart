import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_form/task_form_widget_model.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({Key? key}) : super(key: key);

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  TaskFormWidgetModel? _model;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_model == null) {
      final groupKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = TaskFormWidgetModel(groupKey: groupKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TaskFormWidgetModelProvider(
      model: _model!,
      child: const _TaskFormWidgetBody(),
    );
  }
}

class _TaskFormWidgetBody extends StatelessWidget {
  const _TaskFormWidgetBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'done',
        onPressed: (() => TaskFormWidgetModelProvider.watch(context)
            ?.model
            .saveTasks(context)),
        child: const Icon(Icons.done),
      ),
      appBar: AppBar(
        title: const Text('new task'),
      ),
      body: const Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: TaskNameWidget(),
      )),
    );
  }
}

class TaskNameWidget extends StatelessWidget {
  const TaskNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = TaskFormWidgetModelProvider.read(context)?.model;
    return Center(
      child: TextField(
        autofocus: true,
        minLines: null,
        maxLines: null,
        expands: true,
        onChanged: (value) => model?.tasktext = value,
        onEditingComplete: () => model?.saveTasks(context),
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: 'Enter task text'),
      ),
    );
  }
}
