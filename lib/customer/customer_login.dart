import 'package:flutter/material.dart';
import 'package:myapp/customer/customer_register.dart';
import 'package:myapp/customer/customer_homepage.dart';
import 'package:myapp/helpers/dbhelper.dart';
import 'package:myapp/models/customer.dart';

class CustomerLogin extends StatefulWidget {
  const CustomerLogin({super.key});

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _alertformKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _forgotPasswordStatus = '';
  final _emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+)(\.[a-zA-Z]{2,})+$');

// db code starts
  void _submitform() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      DatabaseHelper dbHelper = DatabaseHelper.instance;
      Customer? customer =
          await dbHelper.authenticateCustomer(_email, _password);
      if (customer != null) {
        ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text("Login successful"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CustomerHomePage();
            },
          ),
        );
      } else {
        ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text("Invalid email or password"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
// db code ends
  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter email';
    }
    if (!_emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
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

  void _forgotPassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Forgot Password?'),
          content: Form(
            key: _alertformKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!_emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _email = newValue!,
                  decoration: const InputDecoration(
                    hintText: 'Enter Registered Email',
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_alertformKey.currentState!.validate()) {
                      _alertformKey.currentState!.save();
                      // Replace with your actual logic to send reset link via email

                      // TODO: Implement logic to check db for registered email and send reset link
                      setState(() {
                        _forgotPasswordStatus =
                            'Password reset link sent to registered email: $_email';
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
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
                    const Text(
                      "Welcome, Login to continue",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                      onSaved: (newValue) => _email = newValue!,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
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
                      onSaved: (newValue) => _password = newValue!,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: _forgotPassword,
                          child: const Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitform,
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const CustomerRegister();
                                },
                              ),
                            );
                          },
                          child: const Text("Sign Up"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _forgotPasswordStatus,
                      style: const TextStyle(color: Colors.green),
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
