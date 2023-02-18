import 'package:eraasoftproject/screens/vertification.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class numbers extends StatelessWidget {
  const numbers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter Your mobile number",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),

                SizedBox(height: 30,),

                Text("Mobile Number",style: TextStyle(fontSize: 15,color: Colors.grey,),),
                SizedBox(height: 15,),
              IntlPhoneField(
                onTap: (){},
                decoration: InputDecoration(
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              )

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>vertification()));
        },

        backgroundColor: Color(0xff53B175),
        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
      ),
    );
  }
}
