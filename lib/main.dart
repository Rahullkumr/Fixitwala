import 'package:flutter/material.dart';
import 'package:fixitwala/landing_page.dart';
import 'package:fixitwala/my_drawer.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fixitwala'),
          centerTitle: true,
        ),
        drawer: const MyDrawer(),
        body: const LandingPage(),
      ),
    );
  }
}

/*
bottomNavigationBar: NavigationBar(
  destinations: const [
    NavigationDestination(icon: Icon(Icons.home), label: "Dashboard"),
    NavigationDestination(icon: Icon(Icons.history), label: "History"),
    // NavigationDestination(icon: Icon(Icons.menu_open), label: "Services"),
    NavigationDestination(
        icon: Icon(Icons.chat_rounded), label: "Chat"),
    NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
  ],
),
*/