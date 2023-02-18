import 'package:flutter/material.dart';


import '../component/button.dart';
import 'login.dart';
class location extends StatelessWidget {
  const location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/illustration.png"),),
                  SizedBox(height:50,),
                  Text("Select Your Location",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Text("switch on your location to stay in tune with what's happing in your area",style: TextStyle(color: Colors.grey,fontSize: 13),),
                  SizedBox(height: 80,),
                  Align(child: Text("Your zone",style: TextStyle(color: Colors.grey),),alignment: Alignment.topLeft,),

                  TextFormField(
                    decoration: InputDecoration(

                    ),
                    style: TextStyle(fontSize: 20,),

                  ),
                  SizedBox(height: 35,),
                  button("Submit",(){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
