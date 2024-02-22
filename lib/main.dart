import 'package:flutter/material.dart';
import 'package:myapp/admin/admin_dashboard.dart';
import 'package:myapp/customer/customer_dashboard.dart';
import 'package:myapp/customer/customer_login.dart';
import 'package:myapp/serviceProvider/service_provider_dashboard.dart';
import 'package:myapp/serviceProvider/service_provider_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fixitwala',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myCurrentIndex = 0;
  List screens = [
    const LandingPage(),
    const CustomerLogin(),
    const SPLogin(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          currentIndex: myCurrentIndex,
          onTap: (index) {
            setState(() {
              myCurrentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_3),
              label: "Customer",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2),
              label: "Service Provider",
            ),
          ],
        ),
        body: screens[myCurrentIndex],
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {

    // TODO: Add some wallpaper or something for landing page

    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'This app works only in Pune',
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