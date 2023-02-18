import 'package:eraasoftproject/network/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/button.dart';
import '../model/Products.dart';
import '../network/cubit/cubit.dart';

class Mycarts extends StatelessWidget {
  Mycarts({Key? key}) : super(key: key);
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController addresscontroller = new TextEditingController();
  TextEditingController citycontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
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
    return BlocProvider.value(
      value: appcubit.get(context)..getCarts(),
      child: BlocConsumer<appcubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = appcubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                "My Carts",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return buildContainer(
                          cubit.productsInCart?.productData?[index] ?? ProductData(),
                          images[index],
                          context,
                        );
                      },
                      itemCount: cubit.productsInCart?.productData?.length ?? 0,
                    ),
                  ),
                  button("Go to checkout", () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 28, right: 10, top: 25, bottom: 25),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Go to checkout",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.close))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: "Name",
                                      suffixIcon: Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      suffixIcon: Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: "Address",
                                      suffixIcon: Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: "City",
                                      suffixIcon: Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: "Phone",
                                      suffixIcon: Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "By placing an order you agree to our Terms And Conditions",
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 13),
                                  ),
                                  SizedBox(height: 25),
                                  button("Place order", () {
                                    cubit.makeorder(
                                        namecontroller.text,
                                        emailcontroller.text,
                                        addresscontroller.text,
                                        citycontroller.text,
                                        phonecontroller.text,
                                        context);
                                  })
                                ],
                              ),
                            ),
                          );
                        });
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding buildContainer(ProductData productData, images, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: double.infinity,
        height: 70,
        child: ListTile(
            leading: Image(
              image: AssetImage("${images}"),
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
            title: Text(
              "${productData.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("325ml,price"),
            trailing: Text(
              "\$${productData.price}",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
