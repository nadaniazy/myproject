import 'package:eraasoftproject/model/Products.dart';
import 'package:eraasoftproject/model/account_model.dart';
import 'package:eraasoftproject/network/diohelper.dart';
import 'package:eraasoftproject/network/endpoints.dart';
import 'package:eraasoftproject/screens/Accounts.dart';
import 'package:eraasoftproject/screens/Explore.dart';
import 'package:eraasoftproject/screens/Favourits.dart';
import 'package:eraasoftproject/screens/HomeScreen.dart';
import 'package:eraasoftproject/screens/Mainhome.dart';
import 'package:eraasoftproject/screens/Mycarts.dart';
import 'package:eraasoftproject/screens/beverages.dart';
import 'package:eraasoftproject/screens/login.dart';
import 'package:eraasoftproject/screens/order_acceptence.dart';
import 'package:eraasoftproject/screens/productdetails.dart';
import 'package:eraasoftproject/screens/products.dart';
import 'package:eraasoftproject/screens/search.dart';
import 'package:eraasoftproject/screens/sign%20up.dart';
import 'package:eraasoftproject/screens/splashscreen.dart';
import 'package:flutter/material.dart';

import 'local/shared_prefernce.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefernce.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
