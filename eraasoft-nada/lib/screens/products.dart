import 'dart:math';
import 'package:eraasoftproject/network/cubit/cubit.dart';
import 'package:eraasoftproject/network/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/Products.dart';

class Product extends StatelessWidget {
  Product({Key? key}) : super(key: key);
  List images = [
    "assets/pngfuel 3.png",
    "assets/pngfuel 4.png",
    "assets/pngfuel 5.png",
    "assets/8-82858_download-sack-of-rice-png 1.png",
    "assets/92f1ea7dcce3b5d06cd1b1418f9b9413 3.png",
    "assets/4215936-pulses-png-8-png-image-pulses-png-409_409 1.png",
    "assets/92f1ea7dcce3b5d06cd1b1418f9b9413 3.png",
    "assets/92f1ea7dcce3b5d06cd1b1418f9b9413 3 (2).png",
    "assets/chicken.png",
    "assets/pngfuel 1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => appcubit()..getproducts(),
        child: BlocConsumer<appcubit, appstates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = appcubit.get(context);
              return cubit.productsList!=null? Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    elevation: 0,
                    title: Text("Find Products",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    centerTitle: true,
                    backgroundColor: Colors.white,
                  ),
                  body: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( maxCrossAxisExtent: 250,childAspectRatio:4/4,mainAxisExtent: 300, ), itemCount: cubit.productsList!.data!.productData!.length,itemBuilder: (context,index){
                          return dataaa(
                              cubit.productsList!.data!.productData![index],
                              images[Random().nextInt(images.length)],
                              context);

                        }
                        ),
                      ),

                  )
              ):Center(
                child: CircularProgressIndicator(),
              );
            }));
  }

  Padding dataaa(ProductData dataProduct, images, context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 180,
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black.withOpacity(0.2))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("${images}"),
                  width: 110,
                  height: 110,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "${dataProduct.name}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "330ml, Price",
                style: TextStyle(fontSize: 13, color: Colors.grey),
                maxLines: 1,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${dataProduct.price}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xff53B175),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
