import 'package:eraasoftproject/network/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/Products.dart';
import '../network/cubit/states.dart';
import 'searchofproduct.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  TextEditingController searchcontroller = new TextEditingController();
  List images = [

    "assets/pngfuel 16.png",
    "assets/pngfuel 18.png",
    "assets/egg-noodle (1) 2.png",
    "assets/American-Garden-Mayonnaise-Eggless-473ml 2.png",
    "assets/hiclipart 2.png",
    "assets/rp_24790392_0053554627_l 2.png",
    "assets/pngfuel 18.png",
    "assets/egg-noodle (1) 2.png",
    "assets/American-Garden-Mayonnaise-Eggless-473ml 2.png",
    "assets/hiclipart 2.png",
    "assets/American-Garden-Mayonnaise-Eggless-473ml 2.png",
    "assets/hiclipart 2.png",
    "assets/rp_24790392_0053554627_l 2.png",
    "assets/pngfuel 18.png",
    "assets/egg-noodle (1) 2.png",

  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      appcubit()
        ..getproducts(),
      child: BlocConsumer<appcubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = appcubit.get(context);
          return  Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: TextFormField(
                    controller: searchcontroller,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "search",
                      suffixIcon: IconButton(icon: Icon(Icons.close, color: Colors.black,size: 19,),onPressed: (){
                        cubit.searchcontroller.text="";
                      },),

                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none)
                    ),
                  ),

                ),
              ),

              actions: [
                IconButton(onPressed: () {
                  // cubit.search(searchcontroller.text, context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchOfProduct(name: searchcontroller.text,)));
                },
                  icon: Icon(Icons.card_travel_rounded, color: Colors.black,
                    size: 25,),)
              ],
            ),

            body:cubit.productsList!=null? Padding(
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
                          cubit.productsList!.data!.productData![index], images[index],
                          context);
                    }, itemCount: cubit.productsList!.data!.productData!.length,

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
                "4pcs, Price",
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
