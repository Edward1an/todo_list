import 'package:flutter/material.dart';
import 'package:todo_list/widgets/group_form/group_form_widget_model.dart';

class GroupsFormWidget extends StatefulWidget {
  const GroupsFormWidget({Key? key}) : super(key: key);

  @override
  State<GroupsFormWidget> createState() => _GroupsFormWidgetState();
}

class _GroupsFormWidgetState extends State<GroupsFormWidget> {
  final _model = GroupsFormWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupsFormWidgetModelProvider(
        model: _model, child: const _GroupsFormWidgetBody());
  }
}

class _GroupsFormWidgetBody extends StatelessWidget {
  const _GroupsFormWidgetBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'done',
        onPressed: (() => GroupsFormWidgetModelProvider.watch(context)
            ?.model
            .saveGroup(context)),
        child: const Icon(Icons.done),
      ),
      appBar: AppBar(
        title: const Text('new group'),
      ),
      body: const Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: GroupsNameWidget(),
      )),
    );
  }
}

class GroupsNameWidget extends StatelessWidget {
  const GroupsNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GroupsFormWidgetModelProvider.read(context)?.model;
    return Center(
      child: TextField(
        autofocus: true,
        onChanged: (value) => model?.groupName = value,
        onEditingComplete: () => model?.saveGroup(context),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: 'Enter name'),
      ),
    );
  }
}
