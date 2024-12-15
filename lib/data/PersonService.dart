import 'package:flutter/cupertino.dart';

import '../presentation/models/PersonModel.dart';
import 'UserService.dart';
import 'dio_config.dart';
import 'dart:convert';

var profileModel = PersonModel(
    "Петров П.К.",
    "ЭФБО-01-22",
    8,
    "+79999999999",
    "some@email.com"
);

Future<PersonModel> getProfile() async {
  var userId = getUserId();
  var result = await getHttpClient().get("/profile/$userId");
  return deserializeProfile(jsonDecode(result.data));
}
PersonModel deserializeProfile(dynamic json) {
  debugPrint(json.toString());

  return PersonModel(
      json['username'],
      "ЭФБО-01-22",
      13,
      "+78005553535",
      json['email']
  );
}