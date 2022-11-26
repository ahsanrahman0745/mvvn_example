import 'dart:io';

import 'package:mvvn_example/users_list/repo/api_status.dart';

import '../../utils/constant.dart';
import 'package:http/http.dart' as http;

import '../models/user_list_model.dart';


class UserServices {
  static Future<Object> getUsers () async {
    try {
      var url = Uri.parse(USERS_LIST);
      var response  = await http.get(url);
      if(200 == response.statusCode){
        return Success(response: userListModelFromJson(response.body));
      }
      return Failure(code: USER_INVALID_RESPONSE, errorResponse: "Invalid Response");


    }on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    }on FormatException {
      return Failure(code: INVALID_FORMATE, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: "Unknown Error");
    }
  }
}