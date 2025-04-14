import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/models/user_model.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<StatefulWidget> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      context.read<UserProvider>().fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider provider = context.watch<UserProvider>();
    List<User> users = provider.users;
    String errorMessage = provider.errorMessage;
    bool isLoading = provider.isLoading;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Center(
        child: Builder(builder: (context) {
          if (isLoading) {
            return CircularProgressIndicator();
          } else if (errorMessage.isNotEmpty) {
            return Text('Error: $errorMessage');
          } else if (users.isEmpty) {
            return Text('No data found.');
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<UserProvider>().fetchUsers();
              },
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserCard(
                    name: user.name,
                    email: user.email,
                    city: user.city,
                  );
                },
              ),
            );
          }
        }),
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
      child: ListTile(
        title: Text(name),
        subtitle: Text('$email / $city'),
      ),
    );
  }
}
