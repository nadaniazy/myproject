import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eraasoftproject/network/endpoints.dart';
import 'package:eraasoftproject/screens/Explore.dart';
import 'package:eraasoftproject/screens/productdetails.dart';
import 'package:eraasoftproject/screens/products.dart';
import 'package:eraasoftproject/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/Products.dart';
import '../model/categories.dart';
import '../network/cubit/cubit.dart';
import '../network/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
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
      create: (context) => appcubit()
        ..getcategories()
        ..getproducts(),
      child: BlocConsumer<appcubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = appcubit.get(context);
          return Scaffold(
            body: cubit.productsList != null && cubit.categoriess != null
                ? SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Image(
                              image: AssetImage("assets/Group.png"),
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on_sharp),
                                Text("Dhaka,Banassre"),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.none,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: "Search Store",
                                prefixIcon: Icon(Icons.search),
                              ),
                              onTap: () {
                                // cubit.changepages(2);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Context) => Search()));
                              },
                            ),
                            SizedBox(height: 10,),
                            CarouselSlider(
                              items: List.generate(
                                cubit.categoriess?.data?.data?.length ?? 0,
                                (index) => buildContainer(
                                    cubit.categoriess?.data?.data?[index] ??
                                        Category()),
                              ),
                              options: CarouselOptions(
                                enableInfiniteScroll: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                reverse: false,
                                height: 150,
                                viewportFraction: 1.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Exclusive Offer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Product()));
                                    },
                                    child: Text(
                                      "See all",
                                      style:
                                          TextStyle(color: Color(0xff53B175)),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 260,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return productOffer(
                                    cubit.productsList?.data
                                            ?.productData?[index] ??
                                        ProductData(),
                                    images[Random().nextInt(images.length)],context
                                  );
                                },
                                itemCount: cubit.productsList?.data?.productData
                                        ?.length ??
                                    0,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Best Selling",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Product()));},
                                    child: Text(
                                      "See all",
                                      style:
                                          TextStyle(color: Color(0xff53B175)),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 260,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return productOffer(cubit.productsList?.data?.productData?[index] ?? ProductData(),
                                      images[Random().nextInt(images.length)],context);

                                },
                                itemCount: cubit.productsList?.data?.productData
                                        ?.length ??
                                    0,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Explore()));
                                  },
                                  child: Text(
                                    "See all",
                                    style: TextStyle(color: Color(0xff53B175)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                           SizedBox(
                             height: 150,
                             child: ListView.builder(
                               physics: BouncingScrollPhysics(),
                               scrollDirection: Axis.horizontal
                               ,itemBuilder: (context,index){
                               return buildContainer1(images[Random().nextInt(images.length)], cubit.categoriess!.data!.data![index]);
                             },itemCount:cubit.categoriess!.data!.data!.length,),
                           )
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Padding buildContainer1(images,Category category) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 290,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
         border: Border.all(color: Colors.black.withOpacity(0.2)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image:AssetImage(images),height: 85,width:85,fit: BoxFit.contain,),
              SizedBox(width: 15,),
              Text("${category.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            ],
          ),
        ),
      ),
    );
  }

  Padding productOffer(ProductData dataProduct, images,context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>productinfo(dataProduct)));
        },
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
                    height: 80,
                    fit: BoxFit.cover,
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
                  "7pcs, Priceg",
                  style: TextStyle(color: Colors.grey),
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
      ),
    );
  }

  Container buildContainer(Category categoryData) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/Rectangle 21.png",
        ),
            fit: BoxFit.cover
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage("assets/2771 1.png"),
            width: 80,
            height: 90,
            fit: BoxFit.contain,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${categoryData.name}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              Text(
                "1kg, Price",
                style: TextStyle(fontSize: 13,color: Colors.green),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                  image: AssetImage("assets/pngfuel 1.png"),
                  width:50,
                  height: 50,fit: BoxFit.contain,),
              Image(
                  image: AssetImage("assets/3698 1.png"), width: 50, height: 50,fit: BoxFit.contain,)
            ],
          )
        ],
      ),
    );
  }
}
