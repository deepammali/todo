import 'package:flutter/material.dart';

// class listTodo extends StatefulWidget {
//   ListView makeTodoList() {
//     return ListView.builder(itemBuilder: (context, index){
//       return ListTitle(title: Text(Hello))
//     })
//   }
// }

class Todo {
  String name;
  bool isBought;
  Todo(this.name, this.isBought);
}

class TodoCard extends StatelessWidget {
  final Todo todo;
  TodoCard(this.todo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg',
        ),
      ),
      title: Text(todo.name),
      // )
      //   ],
      // ),
    );
  }
}
