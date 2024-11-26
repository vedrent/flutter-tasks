import 'package:flutter/material.dart';
import 'package:task_5/presentation/screens/MainRouter.dart';
import 'package:task_5/data/UserService.dart';
import 'package:task_5/presentation/screens/auth/SignupScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://smixybcluwnbeqjzecsb.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNtaXh5YmNsdXduYmVxanplY3NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI2MDI0MDAsImV4cCI6MjA0ODE3ODQwMH0.XrnI4I-BE_17H63YI5wH40vaYRHvH55QyOttBnoPpbA'
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
          useMaterial3: true,
        ),
        home: Container(
          child: getSignupOrMain(),
        )
    );
  }
}

Widget getSignupOrMain() {
  return const SignupScreen();
}