import 'package:flutter/material.dart';
import 'package:task_5/presentation/screens/MainRouter.dart';
import 'package:task_5/presentation/models/PersonModel.dart';
import 'package:task_5/data/UserService.dart';
import 'package:task_5/presentation/screens/auth/SigninScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import '../../widgets/TextFieldWidget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var email = "";
  var password = "";
  var phoneNumber = "";
  var name = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Регистрация"),
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
                hintText: "Email",
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

              const SizedBox(height: 8.0),
              TextFieldWidget(
                initialValue: name,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                hintText: "Имя",
              ),

              const SizedBox(height: 8.0),
              TextFieldWidget(
                initialValue: phoneNumber,
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
                hintText: "Телефон",
              ),

              const SizedBox(height: 24.0),

              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const SigninScreen())
                    );
                  },
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(300,50),
                  ),
                  child: const Text("Уже есть аккаунт")
              ),
              const SizedBox(height: 8.0),
              OutlinedButton(
                  onPressed: () {
                    debugPrint("OutlinedButton pressed");
                    try {
                      signup(
                          password,
                          PersonModel(name, "", 0, phoneNumber, email),
                          signupCallback
                      );
                    }
                    catch(e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Что-то пошло не так!')),
                      );
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
                  child: const Text("Создать аккаунт")
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signupCallback() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Регистрация успешна!')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainRouter()),
    );
  }


}