import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/models/user_model.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/services/user_service.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Center(
        child: FutureBuilder(
          future: UserService().fetch(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            List<Widget> children = [];
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              for (var user in snapshot.data!) {
                children.add(UserCard(
                  name: user.name,
                  email: user.email,
                  city: user.city,
                ));
              }
              return ListView(
                children: children,
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('No data found.');
            }
          },
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final String city;

  const UserCard({
    super.key,
    required this.name,
    required this.email,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Name : $name'),
          Text('Email : $email'),
          Text('City : $city'),
        ],
      ),
    );
  }
}
