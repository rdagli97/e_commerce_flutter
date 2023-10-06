import 'dart:convert' as convert;
import 'dart:developer' as developer;

import 'package:flutter_e_commerce_app/data/models/comment_image_model.dart';
import 'package:flutter_e_commerce_app/data/models/product_image_model.dart';
import 'package:flutter_e_commerce_app/data/models/product_model.dart';
import 'package:flutter_e_commerce_app/data/models/user_model.dart';
import 'package:flutter_e_commerce_app/data/repo/shared_preference.dart';
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
    required String gender,
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
          'gender': gender,
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
    required String image,
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
          'image': image,
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
          'Accept': applicationJson,
        },
        body: {
          'email': email,
          'password': password,
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
    required String adress,
    required String aboutUs,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    String? token;
    token = await SharedPreference().getToken();

    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/update'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
        body: {'adress': adress, 'about_us': aboutUs},
      );

      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = UserModel.fromJson(body);
          break;
        case 401:
          apiResponse.error = unauthorized;
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

  Future<ApiResponse> getCurrentUserDetails() async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == 'null' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/user'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
      );

      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = UserModel.fromJson(body);
          break;
        case 401:
          apiResponse.error = unauthorized;
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

  // PRODUCT

  Future<ApiResponse> createProduct({
    required String title,
    required String description,
    required double price,
    required String category,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/product/create'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
        body: {
          'title': title,
          'description': description,
          'price': price.toString(),
          'category': category,
        },
      );

      final dynamic body = convert.jsonDecode(response.body);

      switch (response.statusCode) {
        case 200:
          apiResponse.data = ProductsModel.fromJson(body);
          break;
        case 422:
          final errors = body['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
          developer.log(apiResponse.error.toString());
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

  // delete product
  Future<ApiResponse> deleteProduct({
    required int productId,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/product/$productId/delete'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
      );

      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = body['message'];
          break;
        case 404:
          apiResponse.error = body['message'];
          break;
        case 403:
          apiResponse.error = body['message'];
          break;
        case 401:
          apiResponse.error = unauthorized;
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

  Future<ApiResponse> giveDiscount({
    required int productId,
    required int discountValue,
    required double price,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/product/$productId/discount'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
        body: {
          'discount': discountValue.toString(),
          'price': price.toString(),
        },
      );

      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = body['message'];
          break;
        case 404:
          apiResponse.error = body['message'];
          break;
        case 403:
          apiResponse.error = body['message'];
          break;
        case 401:
          apiResponse.error = unauthorized;
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

  Future<ApiResponse> changePrice({
    required int productId,
    required double price,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/product/$productId/change/price'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
        body: {
          'price': price.toString(),
        },
      );

      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = body['message'];
          break;
        case 404:
          apiResponse.error = body['message'];
          break;
        case 403:
          apiResponse.error = body['message'];
          break;
        case 401:
          apiResponse.error = unauthorized;
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

  Future<ApiResponse> getProducts() async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/products'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
      );

      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          List<dynamic> productList = List.from(body['products']);
          apiResponse.data =
              productList.map((e) => ProductsModel.fromJson(e)).toList();
          break;
        case 401:
          apiResponse.error = unauthorized;
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

  // buy product
  Future<ApiResponse> buyProduct({
    required int productId,
    required int piece,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/buyed_product/$productId/create'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
        body: {
          'piece': piece,
        },
      );
      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = body['message'];
          break;
        case 403:
          apiResponse.error = body['message'];
          break;
        case 401:
          apiResponse.error = unauthorized;
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

  // create comment
  Future<ApiResponse> createComment({
    required int rating,
    required String comment,
    required int productId,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/product/$productId/create'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
        body: {
          'rating': rating,
          'comment': comment,
        },
      );

      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = body['message'];
          break;
        case 404:
          apiResponse.error = body['message'];
          break;
        case 401:
          apiResponse.error = unauthorized;
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

  Future<ApiResponse> deleteComment({
    required int commentId,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/comments/$commentId/delete'),
        headers: {'Accept': applicationJson, 'Authorization': 'Bearer $token'},
      );

      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = body['message'];
          break;
        case 404:
          apiResponse.error = body['message'];
          break;
        case 403:
          apiResponse.error = body['message'];
          break;
        case 401:
          apiResponse.error = unauthorized;
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

  Future<ApiResponse> addOrRemoveFavourite({
    required int productId,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/product/$productId/favourite'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
      );

      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = body['message'];
          break;
        case 404:
          apiResponse.error = body['message'];
          break;
        case 401:
          apiResponse.error = unauthorized;
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

  Future<ApiResponse> createProductImage({
    required String image,
    required int productId,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/product/$productId/create/product_image'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
        body: {
          'image': image,
        },
      );
      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = ProductImageModel.fromJson(body);
          break;
        case 403:
          apiResponse.error = body['message'];
          break;
        case 401:
          apiResponse.error = unauthorized;
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

  Future<ApiResponse> createCommentImage({
    required String image,
    required int commentId,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    String? token = await SharedPreference().getToken();
    if (token == '' || token.isEmpty) {
      developer.log(nullToken);
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/comment/$commentId/create/comment_image'),
        headers: {
          'Accept': applicationJson,
          'Authorization': 'Bearer $token',
        },
        body: {
          'image': image,
        },
      );
      final dynamic body = convert.jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = CommentImageModel.fromJson(body);
          break;
        case 404:
          apiResponse.error = body['message'];
          break;
        case 403:
          apiResponse.error = body['message'];
          break;
        case 401:
          apiResponse.error = unauthorized;
          break;
        default:
          apiResponse.error = somethingWentWrong;
      }
    } catch (e) {
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
}
