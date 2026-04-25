import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:community/theme/app_theme.dart';
import 'package:community/screens/auth_screen.dart';

void main() {
  runApp(const CommUnityApp());
}

class CommUnityApp extends StatelessWidget {
  const CommUnityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Add providers here as needed later
        Provider<String>.value(value: "Placeholder Provider"),
      ],
      child: MaterialApp(
        title: 'CommUnity',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const AuthScreen(),
      ),
    );
  }
}
