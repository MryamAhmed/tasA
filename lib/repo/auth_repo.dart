import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository{
  login(String email,String password) async{
    Uri url=Uri.parse('https://student.valuxapps.com/api/login');

    var res = await http.post(
        url,
        headers: {},
        body: {"email": email, "password": password}
    );

    final data = json.decode(res.body);
  }
}