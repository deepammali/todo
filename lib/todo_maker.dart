import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class ListTodo extends StatefulWidget {
  const ListTodo({Key? key}) : super(key: key);

  @override
  State<ListTodo> createState() => _ListTodo();
}

class _ListTodo extends State<ListTodo> {
  // var list = List<String>.generate(10, (n) => "List Todo HELLO $n");

  final List<Todo> _todoList = [
    Todo('Lemon', false),
    Todo('Milk', false),
    Todo('Tea', false),
    Todo('Sugar', false),
  ];

  final double _todoHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _todoList.isNotEmpty
          ? ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return _todo(context, index);
              },
            )
          : const Center(
              child: Text(
                'Add Todo(s) to get Started!',
              ),
            ),
    );
  }

  Widget _todo(context, index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(
          color: Colors.black,
          width: 0.4,
        ),
      ),
      shadowColor: Colors.lightBlueAccent,
      elevation: 15,
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Dismissible(
        key: UniqueKey(),
        background: _slideRightBackground(),
        secondaryBackground: _slideLeftBackground(),
        child: Container(
          padding: const EdgeInsets.all(5),
          // decoration: _toDecorate(),
          child: InkWell(
            // onTap: () {
            //   print("clicked");
            // },
            child: ListTile(
              // leading: Icon(Icons.star),
              title: Container(
                // decoration: _toDecorate(),
                height: _todoHeight,
                child: Center(
                  child: TodoCard(_todoList[index]),
                ),
              ),
              // trailing: Icon(Icons.more_vert),
            ),
          ),
        ),
      ),
    );
  }

  Decoration _toDecorate() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey,
        // style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  }

  Widget _slideRightBackground() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      // color: Colors.green,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              "Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }

  Widget _slideLeftBackground() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              "Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
