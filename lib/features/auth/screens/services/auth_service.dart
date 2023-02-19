import 'package:amazon_mobile/constants/error-handling.dart';
import 'package:amazon_mobile/constants/global_variables.dart';
import 'package:amazon_mobile/constants/utils.dart';
import 'package:amazon_mobile/models/user.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import "package:amazon_mobile/api_key.dart";

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          email: email,
          id: "",
          name: name,
          password: password,
          address: "",
          type: "",
          token: "");

      http.Response res = await http.post(
        Uri.parse("$uri/api/signup"),
        body: user.toJson(),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            "Account created! Login with the same credentials",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
