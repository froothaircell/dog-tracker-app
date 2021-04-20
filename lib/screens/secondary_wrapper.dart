import 'package:brewcrewtrue/models/user.dart';
import 'package:brewcrewtrue/screens/home/home.dart';
import 'package:brewcrewtrue/screens/home/home_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//  Secondary wrapper that determines whether the user is an admin or not
class SecWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    print(userData.isAdmin);
    if(userData.isAdmin == false){
      return HomeUser();
    }
    else {
      return Home();
    }
  }
}
