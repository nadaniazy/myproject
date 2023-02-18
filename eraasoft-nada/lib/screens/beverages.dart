import 'package:eraasoftproject/screens/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/Products.dart';
import '../network/cubit/cubit.dart';
import '../network/cubit/states.dart';

class Beverages extends StatelessWidget {
  Beverages(this.catId) ;
  int catId;
  // ProductData productData;
  TextEditingController searchcontroller = new TextEditingController();
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
      create: (context) =>
      appcubit()
        ..getproductsofCategory(catId),
      child: BlocConsumer<appcubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = appcubit.get(context);
          return  Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
              title: Text("Beverages",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.linear_scale_rounded,color: Colors.black,))
              ],
            ),
              body:cubit.productsOfCategoryList!=null? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 300,
                            crossAxisSpacing: 5,
                            crossAxisCount: 2,
                            mainAxisSpacing: 5), itemBuilder: (context, index) {
                        return dataaa(
                            cubit.productsOfCategoryList!.data!.productData![index], images[index],
                            context);
                      }, itemCount: cubit.productsOfCategoryList!.data!.productData!.length,

                      ),
                    ),
                  ],
                ),
              ):Center(child: CircularProgressIndicator()),
          );
        },

      ),
    );
  }

  Padding dataaa(ProductData dataProduct, images, context) {
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
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    image:
                    AssetImage("${images}"),
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
                SizedBox(height: 5,),
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
      ),

    );
  }


}
