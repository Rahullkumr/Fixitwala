import 'package:flutter/material.dart';
import 'package:myapp/admin/admin_dashboard.dart';
import 'package:myapp/customer/customer_dashboard.dart';
import 'package:myapp/serviceProvider/service_provider_dashboard.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Add some wallpaper or something for landing page

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'This app works only in Pune City',
              style: TextStyle(fontSize: 40),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AdminDashboard();
                  },
                ),
              );
            },
            child: const Text("Admin Dashboard"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SPDashboard();
                  },
                ),
              );
            },
            child: const Text("Service Provider Dashboard"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CustomerDashboard();
                  },
                ),
              );
            },
            child: const Text("Customer Dashboard"),
          ),
        ],
      ),
    );
  }
}
