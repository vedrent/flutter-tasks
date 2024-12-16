import 'package:task_5/data/dio_config.dart';
import 'package:task_5/presentation/models/PersonModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String? userId = "732dc637-4c86-46b2-8041-2efe68b7f6f2";
final SupabaseClient supabase = Supabase.instance.client;

String? getUserId() {
  return userId;
}

String getAdminId() {
  return "7770f0a4-7700-4df6-94d1-91e7517abd03";
}

bool isAdmin() {
  return getUserId() == getAdminId();
}

void signup(String password, PersonModel profile, VoidCallback callback) async {
  var result = await supabase.auth.signUp(
      email: profile.email,
      password: password
  );

  userId = result.user?.id;

  await getHttpClient().post(
      "/users",
      data: {
        "user_id": result.user?.id,
        "username": profile.name,
        "email": profile.email
      }
  );
  callback();
}
void signin(String email, String password) async {
  var result = await supabase.auth.signInWithPassword(
      email: email, password: password
  );
  if (result.user == null) {
    throw Exception("Что-то пошло не так");
  }
  userId = result.user?.id;
}