import 'package:flutter/material.dart';

class listTodo extends StatefulWidget {
  const listTodo({Key? key}) : super(key: key);

  @override
  State<listTodo> createState() => _ListTodo();
}

class _ListTodo extends State<listTodo> {
  final list = List<String>.generate(10, (n) => "List Todo HELLO $n");
  final double _todoHeight = 100;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return todo(index);
      },
    );
  }

  Widget todo(index) {
    return Dismissible(
      key: Key(list[index]),
      background: slideRightBackground(),
      secondaryBackground: slideLeftBackground(),
      child: Container(
        // decoration: _toDecorate(),
        child: InkWell(
          // onTap: () {
          //   print("${list[index]} clicked");
          // },
          child: ListTile(
            // leading: Icon(Icons.star),
            title: Container(
              decoration: _toDecorate(),
              height: _todoHeight,
              child: Center(
                child: Text(
                  // ignore: unnecessary_string_interpolations
                  '${list[index]}',
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

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
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

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
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
            )
          ],
        ),
      ),
    );
  }
}
