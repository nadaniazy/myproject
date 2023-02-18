import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/button.dart';
import '../model/Products.dart';
import '../network/cubit/cubit.dart';
import '../network/cubit/states.dart';

class Favourits extends StatelessWidget {
  Favourits({Key? key}) : super(key: key);
  List images = [
    "assets/pngfuel 11.png",
    "assets/pngfuel 12.png",
    "assets/pngfuel 13 (1).png",
    "assets/pngfuel 14 (1).png",
    "assets/tree-top-juice-apple-grape-64oz 1 (1).png",
    "assets/tree-top-juice-apple-grape-64oz 1 (2).png",
    "assets/pngfuel 12.png",
    "assets/pngfuel 13 (1).png",
    "assets/pngfuel 14 (1).png",
    "assets/tree-top-juice-apple-grape-64oz 1 (1).png",

  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appcubit()..getproducts(),
      child: BlocConsumer<appcubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = appcubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text("Favourite",style: TextStyle(color: Colors.black),),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body:
              cubit.productsList != null
                  ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                        Expanded(
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return buildContainer(
                                    cubit.productsList!.data!.productData![index],
                                    images[Random().nextInt(images.length)],context);
                              },
                              itemCount: cubit.productsList!.data!.productData!.length,
                              separatorBuilder: (context, index) {
                                return Divider(
                                  thickness: 1,
                                  color: Colors.grey.shade300,
                                );
                              }),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: 6,),
                        button("Add All Cart",(){
                        })
                      ],
                    ),
                  )
                  : Center(child: CircularProgressIndicator())
          );
        },
      ),
    );
  }

  Padding buildContainer(ProductData productData,images,context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: double.infinity,
        height: 70,
        child: ListTile(
          leading: Image(
            image: AssetImage("${images}"),width: 80,height: 80,
            fit: BoxFit.contain,
          ),
          title: Text("${productData.name}",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("325ml,price"),
          trailing: Text("\$${productData.price}",style: TextStyle(fontWeight: FontWeight.bold),)

        ),

      ),
    );
  }
}
