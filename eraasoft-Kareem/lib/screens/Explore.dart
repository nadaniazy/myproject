import 'package:eraasoftproject/model/Products.dart';
import 'package:eraasoftproject/model/categories.dart';
import 'package:eraasoftproject/screens/beverages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../network/cubit/cubit.dart';
import '../network/cubit/states.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appcubit()..getcategories(),
      child: BlocConsumer<appcubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = appcubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              title: Text("Find Categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            body: cubit.categoriess != null
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Search Store",
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 200,
                                    crossAxisSpacing: 15,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15),
                            itemBuilder: (context, index) {
                              return categoryWidget(
                                  cubit.categoriess?.data?.data?[index] ?? Category(),
                                  dataa[index],
                                  context,
                              );

                            },
                            itemCount:
                                cubit.categoriess?.data?.data?.length ?? 0,
                          ),
                        )
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

InkWell categoryWidget(Category categoryData, pro p, context) {
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Beverages(categoryData.id!)));
    },
    child: Container(
      width: 200,
      decoration: BoxDecoration(
          color: p.color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: p.color.withOpacity(0.9))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("${p.images}"),
              width: 110,
              height: 70,
              fit: BoxFit.cover,
            ),
            Text(
              "${categoryData.name}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ),
  );
}

class pro {
  String? images;
  Color color;

  pro(this.color, this.images);
}

List dataa = [
  pro(
    Colors.pink,
    "assets/oil.png",
  ),
  pro(
    Colors.purpleAccent,
    "assets/meet.png",
  ),
  pro(
    Colors.yellow,
    "assets/vegetable.png",
  ),
  pro(
    Colors.orangeAccent,
    "assets/bakery.png",
  ),
  pro(
    Colors.indigoAccent,
    "assets/beverages.png",
  ),
  pro(
    Colors.lime,
    "assets/dairy.png",
  ),
  pro(
    Colors.pink,
    "assets/oil.png",
  ),
  pro(
    Colors.purpleAccent,
    "assets/meet.png",
  ),
  pro(
    Colors.yellow,
    "assets/vegetable.png",
  ),
  pro(
    Colors.orangeAccent,
    "assets/bakery.png",
  ),
  pro(
    Colors.indigoAccent,
    "assets/beverages.png",
  ),

  pro(
    Colors.yellow,
    "assets/vegetable.png",
  ),
  pro(
    Colors.orangeAccent,
    "assets/bakery.png",
  ),
  pro(
    Colors.indigoAccent,
    "assets/beverages.png",
  ),
  pro(
    Colors.lime,
    "assets/dairy.png",
  ),
  pro(
    Colors.pink,
    "assets/oil.png",
  ),
];
