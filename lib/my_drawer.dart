import 'package:flutter/material.dart';
import 'package:myapp/admin/admin_login.dart';
import 'package:myapp/serviceProvider/service_provider_login.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          children: [
            Image.asset(
              'images/banner.jpg',
              fit: BoxFit.contain,
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Wrap(
                runSpacing: 16,
                children: [
                  const ListTile(
                    title: Text(
                      'Please Select your role',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onTap: null,
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_2),
                    title: const Text('Service Provider'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SPLogin();
                        },
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_3),
                    title: const Text('Admin'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AdminLogin();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
