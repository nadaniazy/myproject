import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eraasoftproject/local/shared_keys.dart';
import 'package:eraasoftproject/local/shared_prefernce.dart';
import 'package:eraasoftproject/network/cubit/states.dart';
import 'package:eraasoftproject/screens/Explore.dart';
import 'package:eraasoftproject/screens/location.dart';
import 'package:eraasoftproject/screens/login.dart';
import 'package:eraasoftproject/screens/order_acceptence.dart';
import 'package:eraasoftproject/screens/productdetails.dart';
import 'package:eraasoftproject/screens/searchofproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../component/button.dart';
import '../../model/Products.dart' as product;
import '../../model/categories.dart';
import '../../screens/Accounts.dart';
import '../../screens/Favourits.dart';
import '../../screens/HomeScreen.dart';
import '../../screens/Mainhome.dart';
import '../../screens/Mycarts.dart';
import '../../screens/beverages.dart';
import '../../screens/search.dart';
import '../diohelper.dart';
import '../endpoints.dart';

class appcubit extends Cubit<appstates> {
  appcubit() : super(initialstate());

  static appcubit get(context) => BlocProvider.of(context);
  bool isshow = false;

  void show() {
    isshow = !isshow;
    emit(successstateshow());
  }

  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController usercontroller = new TextEditingController();
  TextEditingController searchcontroller = new TextEditingController();

  void makeregister(String name, String email, String password, context) {
    emit(loadingstateregister());
    DioHelper.postData(endPoint: register, query: {
      name: name,
      email: email,
      password: password,
    }).then((value) {
      emit(successstateregister());
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    }).catchError((e) {
      emit(errorstateregister());
      print(e);
    });
  }

  void makeLogin(String email, String password, context) async {
    emit(loadingstatelogin());
    await DioHelper.postData(endPoint: loginn, query: {'email': email, 'password': password}).then((value) {
      emit(successstatelogin());
      print(value.data);

      SharedPrefernce.put(key: SharedKeys().token, value: value.data["token"]);
      if(value.data['code'] == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Mainhome()));
      }
    }).catchError((error) {
      emit(errorstatelogin());
      print(error.toString());
    });
  }

  Categories? categoriess;

  void getcategories() {
    emit(loadingstatecategories());
    DioHelper.getData(
      endPoint: categories,
      token: SharedPrefernce.get(key: SharedKeys().token),
    ).then((value) {
      print(value.data);
      categoriess = Categories.fromJson(value.data);
      // print(categoriess?.message);
      emit(successstatecategories());
    }).catchError((error) {
      print(error.toString());
      emit(errorstatecategories());
    });
  }

  product.Products? productsList;

  void getproducts() {
    emit(loadingstateproduct());
    DioHelper.getData(
      endPoint: products,
      token: SharedPrefernce.get(key: SharedKeys().token),
    ).then((value) {
      print(value.data);
      productsList = product.Products.fromJson(value.data);
      emit(successstateproduct());
    }).catchError((error) {
      print(error.toString());
      emit(errorstateproduct());
    });
  }

  product.Products? productsOfCategoryList;

  void getproductsofCategory(int catId) {
    emit(loadingstateproduct());
    DioHelper.getData(
      endPoint: '$categories/$catId/$products',
      token: SharedPrefernce.get(key: SharedKeys().token),
    ).then((value) {
      print(value.data);
      productsOfCategoryList = product.Products.fromJson(value.data);
      emit(successstateproduct());
    }).catchError((error) {
      print(error.toString());
      emit(errorstateproduct());
    });
  }

  int currentindex = 0;

  void changepages(index) {
    currentindex = index;
    emit(changepagesstate());
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Shop"),
    BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: "Explore"),
    BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "Cart"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "Favourite"),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account")
  ];
  int count = 1;

  void increment() {
    count++;
    emit(successincrementstate());
  }

  void decrement() {
    count--;
    emit(successdecrementstate());
  }

  bool g = false;

  void changecolorfavourite() {
    g = !g;
    emit(changecolorfavouitestate());
  }

  List screens = [HomeScreen(), Search(), Mycarts(), Favourits(), Accounts()];

  void makeorder(String name, String email, String address, String city, String phone, context) {
    emit(loadingstateorder());
    DioHelper.postData(
      endPoint: orders,
      token: SharedPrefernce.get(key: SharedKeys().token),
    ).then((value) {
      emit(successstateorder());
      print("successful order");
      Navigator.push(context, MaterialPageRoute(builder: (context) => orderappceptance()));
    }).catchError((error) {
      emit(errorstateorder());
      print("failed");
      showDialog(
          context: context,
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: AlertDialog(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage("assets/image 13.png"),
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Oops! Order Failed",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Something went tembly wrong.",
                          style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        button("Please Try Again", () {
                          Navigator.pop(context);
                          makeorder(name, email, address, city, phone, context);
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Mainhome()));
                          },
                          child: Text(
                            "back to home",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )),
            );
          });
    });
  }

  void addProducttocart(int id, int quantity) {
    emit(LoadingStateAddToCart());
    print('tokeeeeeeeeeeeeeeeeeeeeeen' + SharedPrefernce.get(key: SharedKeys().token));
    DioHelper.postData(
      endPoint: '$addToCart/$id',
      data: {'quantity': quantity},
      token: SharedPrefernce.get(key: SharedKeys().token),
    ).then((value) {
      emit(SuccessStateAddToCart());
      print(value.data.toString());
    }).catchError((error) {
      emit(ErrorStateAddToCart());
      print(error.toString());
    });
  }

  product.Data? productsInCart;

  Future<void> getCarts() async {
    emit(LoadingStategetcartt());
    await DioHelper.getData(endPoint: getCartss, token: SharedPrefernce.get(key: SharedKeys().token)).then((value) {
      print(value.data.toString());
      log(jsonEncode(value.data));
      productsInCart = product.Data.fromJson(value.data);
      emit(SuccessStategetcartt());
    }).catchError((error) {
      if (error is DioError) {
        print(error.response?.data);
      }
      emit(ErrorStategetcartt());
      print("Here"+error.toString());
    });
  }

  product.Products? p;

  Future search(String name, context) async {
    emit(LoadingStategetsearch());
    await DioHelper.getData(
            endPoint: '${searchh}',
            query: {
              'name': name,
            },
            token: SharedPrefernce.get(key: SharedKeys().token))
        .then((value) {
      p = product.Products.fromJson(value.data);
      print(value.toString());
      // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchOfProduct(name: name,)));
      emit(SuccessStategetsearch());
      print("found");
    }).catchError((error) {
      print(error.toString());
      print("not found");
      emit(ErrorStategetsearch());
    });
  }
}
