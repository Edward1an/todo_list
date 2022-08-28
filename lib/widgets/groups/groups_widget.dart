import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/widgets/groups/groups_widget_model.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({Key? key}) : super(key: key);

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  final model = GroupsWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupsWidgetModelProvider(
      model: model,
      child: const _GroupWidgetBody(),
    );
  }
}

class _GroupWidgetBody extends StatelessWidget {
  const _GroupWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() =>
            GroupsWidgetModelProvider.read(context)?.model.showForm(context)),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Groups'),
      ),
      body: const _GroupListWidget(),
    );
  }
}

class _GroupListWidget extends StatelessWidget {
  const _GroupListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupCount =
        GroupsWidgetModelProvider.watch(context)?.model.groups.length ?? 0;
    return ListView.separated(
        separatorBuilder: ((BuildContext context, int index) {
          return const Divider(height: 1);
        }),
        itemBuilder: (BuildContext context, int index) {
          return _GroupListRowWidget(
            listIndex: index,
          );
        },
        itemCount: groupCount);
  }
}

class _GroupListRowWidget extends StatelessWidget {
  final int listIndex;
  const _GroupListRowWidget({
    Key? key,
    required this.listIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GroupsWidgetModelProvider.read(context)!.model;
    final group = model.groups[listIndex];
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) => model.deleteGroup(listIndex)),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'delete',
          ),
        ],
      ),
      enabled: true,
      child: ListTile(
        onTap: () => model.showTasks(context, listIndex),
        title: Text(group.name),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
