import 'package:flutter/material.dart';

import '../data/repositories/user_repository.dart';
import '../models/user.dart';

class UserScreen extends StatelessWidget {
  final UserRepository repository;

  const UserScreen({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: FutureBuilder<List<User>>(
        future: repository.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Có lỗi xảy ra'),
            );
          }

          final users = snapshot.data ?? [];

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return ListTile(
                leading: Text('${user.id}'),
                title: Text(user.name),
              );
            },
          );
        },
      ),
    );
  }
}