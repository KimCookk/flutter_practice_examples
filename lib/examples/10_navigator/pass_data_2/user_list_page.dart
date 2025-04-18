import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/10_navigator/pass_data_2/user_model.dart';

import 'user_detail_page.dart';

class UserListPage extends StatelessWidget {
  UserListPage({super.key});

  final List<User> users = [
    User(name: "Kim", email: "kim1941", age: 16),
    User(name: "Lee", email: "lee1231455", age: 66),
    User(name: "Jung", email: "jungddd", age: 26),
    User(name: "Bob", email: "kimbob", age: 116),
    User(name: "Tom", email: "tomcruse", age: 4),
    User(name: "James", email: "jamebond", age: 175),
    User(name: "Can", email: "doit", age: 66),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('User List Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, int) {
              var user = users[int];
              return ListTile(
                title: Text('name : ${user.name}'),
                leading: Text('age : ${user.age}'),
                trailing: Text('email : ${user.email}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailPage(
                        name: user.name,
                        email: user.email,
                        age: user.age,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
