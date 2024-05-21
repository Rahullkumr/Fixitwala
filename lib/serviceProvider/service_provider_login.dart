import 'package:flutter/material.dart';
import 'package:myapp/serviceProvider/service_provider_dashboard.dart';
import 'package:myapp/serviceProvider/service_provider_register.dart';
import 'package:myapp/helpers/dbhelper.dart';
import 'package:myapp/models/service_provider.dart';

class SPLogin extends StatefulWidget {
  const SPLogin({super.key});

  @override
  State<SPLogin> createState() => _SPLoginState();
}

class _SPLoginState extends State<SPLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _alertformKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _forgotPasswordStatus = '';
  final _emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+)(\.[a-zA-Z]{2,})+$');

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

  void _submitform() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      DatabaseHelper dbHelper = DatabaseHelper.instance;
      ServiceProvider? sp =
          await dbHelper.authenticateServiceProvider(_email, _password);

      if (sp != null) {
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
              return const SPDashboard();
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
                    const SizedBox(height: 40),
                    const Text(
                      "Hello Again !",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Welcome Back, You Have Been",
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Missed For A Long Time",
                    ),
                    const SizedBox(height: 40),
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
                          "Login",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
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
                                  return const SPRegister();
                                },
                              ),
                            );
                          },
                          child: const Text("Sign Up"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
