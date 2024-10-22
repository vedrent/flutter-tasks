import 'package:flutter/material.dart';
import 'package:task_5/presentation/screens/main_router.dart';

import 'my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: getTheme(context),
      home: const MainRouter()
    );
  }
}
