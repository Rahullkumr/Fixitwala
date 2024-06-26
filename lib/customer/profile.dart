import 'package:myapp/customer/changepwd.dart';
import 'package:myapp/customer/myreviews.dart';
import 'package:myapp/main.dart';
import 'package:myapp/privacy_policy.dart';
import 'package:myapp/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align sections to left
          children: [
            const SizedBox(height: 10),
            _buildUserInfoSection(),
            const SizedBox(height: 15),
            const Divider(thickness: 1.0), // Section divider
            _buildGeneralSection(
                context), // Reusable widget for general options
            const Divider(thickness: 1.0), // Section divider
            _buildAboutAppSection(
                context), // Reusable widget for About App options
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoSection() {
    // TODO: data from db
    return const Row(
      children: [
        CircleAvatar(
          radius: 45.0,
          backgroundImage: AssetImage('images/customer.png'),
        ),
        SizedBox(width: 30.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rajesh Mistri',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 5.0),
            Text(
              'rajesh@gmail.com',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGeneralSection(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Change Password'),
          leading: const Icon(Icons.lock),
          trailing: const Icon(Icons.chevron_right),
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ChangePasswordPage();
          })), // Navigation
        ),
        ListTile(
          title: const Text('My Reviews'),
          leading: const Icon(Icons.star),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const MyReviewsPage();
              },
            ),
          ), // Navigation
        ),
      ],
    );
  }

  Widget _buildAboutAppSection(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Privacy Policy'),
          leading: const Icon(Icons.security),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const PrivacyPolicyPage();
            }),
          ), // Navigation
        ),
        ListTile(
          title: const Text('Terms & Conditions'),
          leading: const Icon(Icons.description),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const TermsAndConditionsPage();
            }),
          ), // Navigation
        ),
        const Divider(thickness: 1.0),
        ListTile(
          title: const Text('Delete Account'),
          leading: const Icon(Icons.delete),
          trailing: const Icon(Icons.warning_amber_outlined, color: Colors.red),
          // onTap: (){},
          onTap: () => _confirmDeleteAccount(context), // Confirmation dialog
        ),
        ListTile(
          title: const Text('Logout'),
          leading: const Icon(Icons.exit_to_app),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MyHomePage();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  void _confirmDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete Account'),
        content: const Text(
            'Are you sure you want to delete your account? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              // Handle account deletion logic here (example using a simulated API call)
              final isDeleted = await _deleteAccount(); // Simulate API call
              if (isDeleted) {
                // Account deletion successful - navigate back (or show success message)
                Navigator.popUntil(
                    context, ModalRoute.withName('/')); // Pop until root
              } else {
                // Account deletion failed - show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text('Error deleting account. Please try again later.'),
                  ),
                );
              }
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

// Simulate API call for account deletion (replace with actual API call)
  Future<bool> _deleteAccount() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    // TODO: this should return true
    return false; // Replace with actual success/failure logic from your API
  }
}
