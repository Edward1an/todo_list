import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroupsWidget extends StatelessWidget {
  const GroupsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('groups'),
      ),
      body: const _GroupList(),
    );
  }
}

class _GroupList extends StatefulWidget {
  const _GroupList({Key? key}) : super(key: key);

  @override
  State<_GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<_GroupList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((BuildContext context, int index) {
          return const Divider(height: 1);
        }),
        separatorBuilder: (BuildContext context, int index) {
          return _GroupRowWidget(
            listIndex: index,
          );
        },
        itemCount: 100);
  }
}

class _GroupRowWidget extends StatelessWidget {
  final int listIndex;
  const _GroupRowWidget({
    Key? key,
    required this.listIndex,
  }) : super(key: key);

  void showFrom(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {}),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'delete',
          ),
        ],
      ),
      enabled: true,
      child: ListTile(
        onTap: ((() => showFrom(context))),
        leading: Image.asset(
            '/Users/edwardian/flutter_code_projects/todo_list/images/hs_logo.png'),
        title: const Text('Three-line ListTile'),
        subtitle:
            const Text('A sufficiently long subtitle warrants three lines.'),
        trailing: const Icon(Icons.chevron_right),
        isThreeLine: true,
      ),
    );
  }
}
