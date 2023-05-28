import 'package:flutter/material.dart';

import '../model/user.dart';
import 'Maintenance/drawer.dart';
import 'adminEquipe/drawer.dart';
import 'adminStade/drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user});
  final User user;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  late Widget drawer;
  @override
  void initState() {
    
    super.initState();
    switch (widget.user.role) {
      case Roles.admin:
        drawer = const DrawerAdminPage();
        break;
      case Roles.chefEquipe:
        drawer = const DrawerEquipePage();
        break;
      default:
       drawer = const DrawerManPage();
        break;

    }
    _nameController.text = widget.user.name;
    _passwordController.text = widget.user.password;
    _emailController.text = widget.user.email;
    _roleController.text = widget.user.role.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      drawer: drawer,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              readOnly: true,
              controller: _roleController,
              decoration: const InputDecoration(
                labelText: 'Role',
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Perform save or update logic here
                String name = _nameController.text;
                String email = _emailController.text;
                String password = _passwordController.text;
                String role = _roleController.text;

                // Print the entered values
                print('Name: $name');
                print('Email: $email');
                print('Password: $password');
                print('Role: $role');
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
