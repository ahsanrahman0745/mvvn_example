import 'package:flutter/material.dart';
import 'package:mvvn_example/users_list/views/user_view_model.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (_) => UsersViewModel())],child: MaterialApp(
      title: 'MVVN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const HomeScreen(),
    ),);
  }
}
