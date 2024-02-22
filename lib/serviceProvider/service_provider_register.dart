import 'package:flutter/material.dart';
import 'package:myapp/serviceProvider/service_provider_dashboard.dart';
import 'package:myapp/serviceProvider/service_provider_login.dart';

class SPRegister extends StatefulWidget {
  const SPRegister({super.key});

  @override
  State<SPRegister> createState() => _SPRegisterState();
}

class _SPRegisterState extends State<SPRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final _designation = ["Electrician", "Plumber", "Cleaner", "Carpenter", "Mechanic", "Home Painter"];

  void _submitform() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text("Registration successful"),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const SPDashboard();
          },
        ),
      );
    }
  }

  String? _validateName(value) {
    if (value!.isEmpty) {
      return 'Please enter Name';
    }
    RegExp nameRegExp = RegExp(r'^([a-zA-Z]+\s)*[a-zA-Z]+$');
    if (!nameRegExp.hasMatch(value)) {
      return 'Please enter a valid name';
    }
    if (value.length < 3) {
      return 'Please enter full name';
    }
    return null;
  }

  String? _validateAddress(value) {
    if (value!.isEmpty) {
      return 'Please enter Address';
    }
    if (value.length < 10) {
      return 'Please enter valid address';
    }
    return null;
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validateMobile(value) {
    if (value!.isEmpty) {
      return 'Please enter phone number';
    }
    RegExp mobileRegExp = RegExp(r'^[6789]\d{9}$');
    if (!mobileRegExp.hasMatch(value)) {
      return 'Please enter a valid Number';
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 8) {
      return 'Please enter password with minimum 8 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person, size: 60),
                    ),
                    const SizedBox(height: 15),

                    const Text(
                      "Hello User !",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Text("Create Your Account For Better"),
                    const Text("Experience"),
                    const SizedBox(height: 30),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: _validateName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: _validateAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Contact Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: _validateMobile,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20),

                    // const DropdownMenu(
                    //   width: double.infinity,
                    //   dropdownMenuEntries: [
                    //     DropdownMenuEntry(
                    //       value: _designation[0],
                    //       label: _designation[0],                          
                    //     ),
                    //     DropdownMenuEntry(
                    //       value: "Plumber",
                    //       label: "Plumber",
                    //     ),
                    //     DropdownMenuEntry(
                    //       value: "Cleaner",
                    //       label: "Cleaner",
                    //     ),
                    //     DropdownMenuEntry(
                    //       value: "Carpenter",
                    //       label: "Carpenter",
                    //     ),
                    //     DropdownMenuEntry(
                    //       value: "Mechanic",
                    //       label: "Mechanic",
                    //     ),
                    //     DropdownMenuEntry(
                    //       value: "Home Painter",
                    //       label: "Home Painter",
                    //     ),
                    //   ],
                    // ),
                    
                    const SizedBox(height: 20),

                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: _validatePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 30),

                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitform,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SPLogin();
                                },
                              ),
                            );
                          },
                          child: const Text("Sign In"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
