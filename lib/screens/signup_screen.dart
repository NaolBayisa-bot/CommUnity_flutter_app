import 'package:community/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:community/screens/main_navigation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passController = TextEditingController();
    bool obscureData = true;

    return Scaffold(
      body: SafeArea(
        // 1. LayoutBuilder gets the constraints of the screen
        child: LayoutBuilder(
          builder: (context, constraints) {
            final viewInsets = MediaQuery.of(context).viewInsets.bottom;
            final keyboardOpen = viewInsets > 0;

            return SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24,
                bottom: viewInsets + 24,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - viewInsets,
                ),
                child: Align(
                  alignment: keyboardOpen
                      ? Alignment.topCenter
                      : Alignment.center,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 32),
                        const Text(
                          'Join the Ecosystem',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Create your academic profile to start collaborating.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 48),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            hintText: '',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: '......@gmail.com',
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 19,
                              color: Color.fromARGB(73, 255, 255, 255),
                            ),
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            final emailRegex = RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );
                            if (!emailRegex.hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passController,
                          obscureText: obscureData,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: '',
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureData = false;
                                });
                              },
                              icon: Icon(Icons.visibility_off_outlined),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            final passRegex = RegExp(
                              r'^(?=(?:.*[a-zA-Z]){2})[a-zA-Z0-9]{8,}$',
                            );
                            if (!passRegex.hasMatch(value)) {
                              return 'Password must be at least 8 characters, include a number, and letters.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            try {
                              if (_formKey.currentState!.validate()) {
                                print('Name: ${_nameController.text}');
                                print('Email: ${_emailController.text}');
                                print('Password: ${_passController.text}');
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => const MainNavigation(),
                                  ),
                                );
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: const Text('Create Account'),
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const AuthScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
