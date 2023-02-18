import 'package:eraasoftproject/screens/HomeScreen.dart';
import 'package:eraasoftproject/screens/Mainhome.dart';
import 'package:flutter/material.dart';

import '../component/button.dart';
class orderappceptance extends StatelessWidget {
  const orderappceptance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/Group 6872-1.png"),width: 220,height: 200,fit: BoxFit.cover,),
              SizedBox(height: 40,),
              Text("Your Order has been accepted",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text("Your items has been placcd and is on it’s way to being processed",style: TextStyle(fontSize: 16,color: Colors.grey.shade400),textAlign: TextAlign.center,),
              SizedBox(height: 40,),
              button("Track order",(){}),
              SizedBox(height: 20,),
              TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Mainhome()));}, child: Text("back to home",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),)
            ],
          ),
        ),
      ),
    );
  }
}
