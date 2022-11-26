import 'package:flutter/material.dart';
import 'package:mvvn_example/users_list/models/user_list_model.dart';
import 'package:mvvn_example/users_list/views/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        child: Column(children: [_UI(usersViewModel)],),
      ),
    );
  }
  _UI(UsersViewModel usersViewModel){
    if(usersViewModel.loading){
      return Container();
    }
    if(usersViewModel.userError != null){
      return Container();
    }
    return Expanded(child: ListView.separated(
        itemBuilder: (context,index){
          UserModel userModel = usersViewModel.userListModel[index];
          return ListTile(
            title: Text(userModel.name),
              subtitle: Text(userModel.email)
          );
        },
        separatorBuilder: (context,index){
          return Divider();
        },
        itemCount: usersViewModel.userListModel.length));
  }
}
