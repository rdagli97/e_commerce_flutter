import 'dart:convert' as convert;
import 'dart:developer' as developer;

import 'package:flutter_e_commerce_app/data/models/user_model.dart';
import 'package:flutter_e_commerce_app/resources/consts/service_strings.dart';
import 'package:http/http.dart' as http;

import '../models/api_response.dart';

class API {
  Future<ApiResponse> registerCustomer({
    required String username,
    required String email,
    required String password,
    required String image,
    required String phone,
  }) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register/customer'),
        headers: {
          'Accept': applicationJson,
        },
        body: {
          'username': username,
          'email': email,
          'password': password,
          'password_confirmation': password,
          'image': image,
          'phone': phone,
        },
      );

      final dynamic body = convert.jsonDecode(response.body);

      switch (response.statusCode) {
        case 200:
          apiResponse.data = UserModel.fromJson(body);
          break;
        case 422:
          final errors = body['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
          developer.log(apiResponse.error.toString());
        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    } catch (e) {
      apiResponse.error = serverError;
    }
    return apiResponse;
  }

  Future<ApiResponse> registerCompany({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register/company'),
        headers: {
          'Accept': applicationJson,
        },
        body: {
          'username': username,
          'email': email,
          'password': password,
          'password_confirmation': password,
          'phone': phone,
        },
      );

      final dynamic body = convert.jsonDecode(response.body);

      switch (response.statusCode) {
        case 200:
          apiResponse.data = UserModel.fromJson(body);
          break;
        case 422:
          final errors = body['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
          developer.log(apiResponse.error.toString());
        default:
          apiResponse.error = somethingWentWrong;
      }
    } catch (e) {
      apiResponse.error = serverError;
    }
    return apiResponse;
  }

  Future<ApiResponse> login({
    required String email,
    required String password,
  }) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Accept' : applicationJson,
        },
        body: {
          'email' : email,
          'password' : password,
        },
      );

      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = UserModel.fromJson(body);
          break;
        case 403:
          apiResponse.error = body['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    } catch (e) {
      apiResponse.error = serverError;
    }
    return apiResponse;
  }

  Future<ApiResponse> updateUser({
    required String image,
    required String address,
    required String aboutUs,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    
  }
}
