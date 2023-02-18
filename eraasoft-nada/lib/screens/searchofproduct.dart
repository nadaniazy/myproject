import 'package:eraasoftproject/model/Products.dart';
import 'package:eraasoftproject/network/cubit/cubit.dart';
import 'package:eraasoftproject/network/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchOfProduct extends StatelessWidget {
  String name;

  SearchOfProduct({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => appcubit()..search(name, context),
        child: BlocConsumer<appcubit, appstates>(
          listener: (context, appstates) {},
          builder: (context, states) {
            var cubit = appcubit.get(context);
            return cubit.p != null
                ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.p!.data!.productData!.length,
                  itemBuilder: (context, index) {
                    return buildContainer(cubit.p!.data!.productData![index]);
                  },
                )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }

  Container buildContainer(ProductData productData) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          Image(
            image: AssetImage("assets/chicken.png"),
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          Text(
            "${productData.name}",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "4pcs,price",
            style: TextStyle(color: Colors.grey.shade300),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("${productData.price}"),
              Container(
                width: 50,
                height: 50,
                child: Icon(Icons.add),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
