import 'package:flutter/material.dart';
import 'package:myapp/serviceProvider/service_provider_dashboard.dart';
import 'package:myapp/serviceProvider/service_provider_login.dart';
import '../models/service_provider.dart';
import '../helpers/dbhelper.dart';

class SPRegister extends StatefulWidget {
  const SPRegister({super.key});

  @override
  State<SPRegister> createState() => _SPRegisterState();
}

class _SPRegisterState extends State<SPRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  // final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _category = [
    "Electrician",
    "Plumber",
    "Cleaner",
    "Carpenter",
    "Mechanic",
    "Home Painter"
  ];
  String _selectedVal = "";

  @override
  void initState() {
    super.initState();
    _selectedVal = _category[0];
  }

  final dbHelper = DatabaseHelper.instance;

  void _submitform() async {
    if (_formKey.currentState!.validate()) {
      
      // Get the form values
      String name = _nameController.text;
      String address = _addressController.text;
      String email = _emailController.text;
      String mobile = _mobileController.text;
      String category = _selectedVal; // Get the selected value
      String description = _descriptionController.text;
      String availability = _availabilityController.text;
      String password = _passwordController.text;

      // Create a Customer object
      ServiceProvider sp = ServiceProvider(
        spName: name,
        address: address,
        emailId: email,
        mobileNo: mobile,
        category: category,
        description: description,
        availability: availability,
        pwd: password,
        verificationStatus: 0,
      );

      // Insert the customer into the database
      await dbHelper.insertServiceProvider(sp).then((value) {
        // Success scenario - handle successful insertion
        ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text("Registration successful"),
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
      }, onError: (error) {
        // Error scenario - handle insertion failure
        ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text("Registration failed"),
            backgroundColor: Colors.red,
          ),
        );
      });
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

  String? _validateAvailability(value) {
    if (value!.isEmpty) {
      return 'Please enter availability in hours';
    }
    if (value.length > 2 || int.parse(value) < 1 || int.parse(value) > 24) {
      return 'Please enter valid hours';
    }
    return null;
  }

  String? _validateDescription(value) {
    if (value!.isEmpty) {
      return 'Please enter shop name or description';
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
                      controller: _nameController,
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
                      controller: _addressController,
                      validator: _validateAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Contact Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      validator: _validateMobile,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField(
                      value: _selectedVal,
                      decoration: const InputDecoration(
                        labelText: "Category",
                        border: OutlineInputBorder(),
                      ),
                      items: _category
                          .map(
                            (eachItemFromCategoryList) => DropdownMenuItem(
                              value: eachItemFromCategoryList,
                              child: Text(eachItemFromCategoryList),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedVal = val as String;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Description/Shop name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: _descriptionController,
                      validator: _validateDescription,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Available hours',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: _availabilityController,
                      keyboardType: TextInputType.number,
                      validator: _validateAvailability,
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
                      controller: _passwordController,
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
                            Navigator.push(
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
