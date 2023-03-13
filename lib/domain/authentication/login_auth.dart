import 'dart:developer';

import 'package:every_home/domain/models/signin_screen/signin_model.dart';

List<Map<String, dynamic>> login = [
  {
    'email': 'customer@gmail.com',
    'password': '12345678',
    'type': 1,
    'user_id': 1
  },
  {
    'email': 'enabler@gmail.com',
    'password': '12345678',
    'type': 2,
    'user_id': 2
  },
  {
    'email': 'business@gmail.com',
    'password': '12345678',
    'type': 3,
    'user_id': 3
  }
];

class LogiAuth {
  Map<String, dynamic> loginAuthentication(SignInModel user) {
    final email = user.email;
    final password = user.password;
    Map<String, dynamic> loginResponse = {};

    for (var map in login) {
      if (map.containsKey("password") && map.containsKey("email")) {
        if (map["email"] == email && map["password"] == password) {
          // log('email and password verified', name: map['type'].toString());
          loginResponse.addAll({
            'user_type': map['type'],
            'user_id': map['user_id'],
            'response': 'user found',
            'status':true
          });
          break;
        } else {
          loginResponse.addAll({
            'user_type': '',
            'user_id': '',
            'response': 'User name and Password doesn\'t match',
            'status': false
          });
          // log('email and password not match');
        }
      }
    }
    return loginResponse;
  }
}
