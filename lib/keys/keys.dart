import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/checkable_todo_item.dart';
// import 'todo_item.dart';

class Todo {
  String text;
  Priority priority;
  Todo(this.text, this.priority);
}

//---------------------------------------------
class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() {
    return _Keys();
  }
}
//-----------------------------------------------

class _Keys extends State<Keys> {
  var _order = "asending";

  final _todoList = [
    Todo(
      'Learn Flutter',
      Priority.urgent,
    ),
    Todo(
      'Practice Flutter',
      Priority.normal,
    ),
    Todo(
      'Explore other courses',
      Priority.low,
    ),
  ];
  List<Todo> get _orderdTheList {
    final sortedTodos = List.of(_todoList);
    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asending' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodos;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asending' ? 'desending' : 'asending';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: _changeOrder,
              icon: Icon(_order == 'asending'
                  ? Icons.arrow_upward
                  : Icons.arrow_downward),
              label:
                  Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}'),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                for (final todo in _orderdTheList)
                  CheckableTodoItem(
                    todo.text,
                    todo.priority,
                    key: ValueKey(todo),
                  ),
              ],
            ),
          ),
        ]);
  }
}
