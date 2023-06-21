import 'package:bloc_app/utils/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/vrouter.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              VRouter.of(context).to(Paths.settings);
            },
          )
        ],
      ),
      body: const Center(child: Text('USER PAGE')),
    );
  }
}
