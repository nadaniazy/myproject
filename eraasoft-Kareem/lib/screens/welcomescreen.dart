import 'package:eraasoftproject/screens/signin.dart';
import 'package:flutter/material.dart';

import '../component/button.dart';

class welcomescreen extends StatelessWidget {
  const welcomescreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(height:MediaQuery.of(context).size.height,width: double.infinity,child: Image(image: AssetImage("assets/welcomeman.png"),fit: BoxFit.cover,)),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("assets/carrot.png"),width: 60,height: 60,),
                SizedBox(height: 15,),
                    Text("Welcome  ",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("to our store",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    SizedBox(height: 5,),
                    Text("Get your groceries in as fast as one hour",style: TextStyle(color: Colors.grey,fontSize: 14),),
                    SizedBox(height: 40,),
                    button("Get Started",(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
    }),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
