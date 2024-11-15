import 'dart:convert';

import 'package:canteen_app/data/model/response/auth_response.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource{

  Future<Either<String, AuthResponse>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.9:8000/api/login'),
      headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponse.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

}