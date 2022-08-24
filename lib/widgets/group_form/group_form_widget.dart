import 'package:flutter/material.dart';

class GroupsFormWidget extends StatelessWidget {
  const GroupsFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
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
    return const Center(
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Enter name'),
      ),
    );
  }
}
