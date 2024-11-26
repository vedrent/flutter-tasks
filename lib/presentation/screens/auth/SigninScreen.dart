import 'package:flutter/material.dart';
import 'package:task_5/presentation/widgets/TextFieldWidget.dart';
import 'package:task_5/presentation/screens/MainRouter.dart';
import 'package:task_5/data/UserService.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Вход"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFieldWidget(
                initialValue: email,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                hintText: "Emain",
              ),
              const SizedBox(height: 8.0),
              TextFieldWidget(
                initialValue: password,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                hintText: "Пароль",
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                  onPressed: () {
                    try {
                      signin(email, password);
                    }
                    catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Что-то пошло не так!')),
                      );
                    }
                    finally {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const MainRouter()
                      ));
                    }
                  },
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(300,50),
                      backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                      side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
                  ),
                  child: const Text(
                      "Войти"
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}