import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rating/rating.dart';

import '../component/button.dart';
import '../model/Products.dart';
import '../model/categories.dart';
import '../network/cubit/cubit.dart';
import '../network/cubit/states.dart';

class productinfo extends StatelessWidget {
  productinfo(this.productData);

  ProductData productData;

  List images = [
    "assets/pngfuel 1 (1).png",
    "assets/92f1ea7dcce3b5d06cd1b1418f9b9413 3.png",
    "assets/92f1ea7dcce3b5d06cd1b1418f9b9413 3 (2).png"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appcubit(),
      child: BlocConsumer<appcubit, appstates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = appcubit.get(context);
            return Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemBuilder: (context, index) {
                          return buildStack(index, context);
                        },
                        itemCount: images.length,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${productData.name}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        cubit.changecolorfavourite();
                                      },
                                      icon: Icon(
                                        Icons.favorite_outline,
                                        color:
                                            cubit.g ? Colors.red : Colors.grey,
                                      ))
                                ],
                              ),
                              Align(
                                child: Text(
                                  "1kg, Price",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            cubit.decrement();
                                          },
                                          icon: Icon(
                                            Icons.minimize,
                                            size: 30,
                                          )),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Colors.black26)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            "${cubit.count}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            cubit.increment();
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 30,
                                          ))
                                    ],
                                  ),
                                  Text(
                                    "\$${productData.price}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ExpansionTile(
                                collapsedBackgroundColor: Colors.white,
                                collapsedTextColor: Colors.black,
                                backgroundColor: Colors.white,
                                title: Text("Product Detail"),
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                          child: Text(
                                              "${productData.description}",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16)))),
                                ],
                              ),
                              ExpansionTile(
                                collapsedBackgroundColor: Colors.white,
                                collapsedTextColor: Colors.black,
                                backgroundColor: Colors.white,
                                title: Text("Nutritions"),
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                          child: Text("${productData.offer}",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16)))),
                                ],
                              ),
                              ExpansionTile(
                                collapsedBackgroundColor: Colors.white,
                                collapsedTextColor: Colors.black,
                                backgroundColor: Colors.white,
                                title: Text("Review"),
                                // trailing: Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   children: [
                                //     Icon(
                                //       Icons.star,
                                //       color: Colors.amber,
                                //     ),
                                //     Icon(Icons.star, color: Colors.amber),
                                //     Icon(Icons.star, color: Colors.amber),
                                //     Icon(Icons.star, color: Colors.amber),
                                //     Icon(Icons.star, color: Colors.amber),
                                //   ],
                                // ),
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Text(
                                        "${productData.updatedAt}",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              button("Add to basket", () {
                                cubit.addProducttocart(productData.id!, cubit.count);
                              }),
                              SizedBox(height: 10,),
                              //ExpansionTile(title: Text("Product Detail"),subtitle: Text("${productData.description}",),trailing: Icon(Icons.arrow_forward_ios),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          }),
    );
  }

  Padding buildStack(int index, context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
              child: Image(
                image: AssetImage("assets/Rectangle 69.png"),
                height: 400,
              )),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.file_download_outlined))
                  ],
                ),
              ),
              Image(
                image: AssetImage("${images[index]}"),
                height: 200,
                width: 230,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
