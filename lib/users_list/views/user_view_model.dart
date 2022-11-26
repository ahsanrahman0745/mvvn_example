import 'package:flutter/material.dart';
import 'package:mvvn_example/users_list/repo/api_status.dart';
import 'package:mvvn_example/users_list/repo/user_services.dart';
import 'package:mvvn_example/users_list/views/user_error.dart';

import '../models/user_list_model.dart';



class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userModelList = [];
  UserError? _userError;

  bool get loading => _loading;
  List<UserModel> get userListModel => _userModelList;
  UserError? get userError => _userError;

  UsersViewModel(){
    getUsers();
  }

  setLoading(bool loading){
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel){
    _userModelList = userListModel;
  }
  setUserError(UserError userError){
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if(response is Success ){
      print(response);
      setUserListModel(response.response as List<UserModel>);
    }
    if(response is Failure ){
      print(
          "${response.code}  \n ${response.errorResponse}"
      );
      //setUserError(UserError(code: response.code, message: response.errorResponse))
    }
    setLoading(false);
  }


}