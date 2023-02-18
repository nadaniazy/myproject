import 'package:flutter/material.dart';


import 'numbers.dart';

class signin extends StatelessWidget {
   signin({Key? key}) : super(key: key);
  TextEditingController countrycontroller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image(
                image: AssetImage("assets/backgroundsignin.png"),
                fit: BoxFit.cover,
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Container(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Get your groceries",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   SizedBox(height: 5,),
                   Text("with nectar",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   SizedBox(height: 30,),
                   TextFormField(
                     controller: countrycontroller,
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>numbers()));
                     },
                     decoration: InputDecoration(
                         prefixIcon: Image(image: AssetImage("assets/country_icon.png"),width: 5,height: 5,),
                       hintText: "+800"
                     ),

                   ),
                   SizedBox(height: 35,),
                   Align(child: Text("or connect with social media",style: TextStyle(color: Colors.grey,fontSize: 16),textAlign: TextAlign.center,),alignment: Alignment.center,),
                   SizedBox(height: 35,),
                   ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(primary: Colors.blue,   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10))),child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image(image: AssetImage("assets/google.png"),width: 30,height: 30,),
                       Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Text("continue with google",style: TextStyle(fontSize: 18),),
                       ),
                     ],
                   )),
                   SizedBox(height: 20,),
                   ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent,   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10))),child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image(image: AssetImage("assets/facebook.png"),width: 30,height: 30,),
                       Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Text("continue with Facebook",style: TextStyle(fontSize: 18),),
                       ),
                     ],
                   ))

                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
