import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../component/button.dart';
import '../network/cubit/cubit.dart';
import '../network/cubit/states.dart';
class signup extends StatelessWidget {
   signup({Key? key}) : super(key: key);
TextEditingController namecontroller=new TextEditingController();
TextEditingController emailcontroller=new TextEditingController();
   TextEditingController passwordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>appcubit(),
      child: BlocConsumer<appcubit,appstates>(
        listener:(context,state){} ,
        builder:(context,state){
          var cubit = appcubit.get(context);
          return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Center(child: Image(image: AssetImage("assets/Group.png"))),
                        SizedBox(height: 50,),
                        Text("Sign up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("Enter your credintiols to continue",style: TextStyle(fontSize: 14,color: Colors.grey),),
                        SizedBox(height: 35,),
                        Text("Username"),
                        SizedBox(height: 5,),

                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller:cubit. usercontroller,
                        ),
                        SizedBox(height: 20,),
                        Text("Email"),
                        SizedBox(height: 5,),

                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller:cubit. emailcontroller,
                        ),
                        SizedBox(height: 20,),
                        Text("password"),
                        SizedBox(height: 5,),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller:cubit. passwordcontroller,
                          decoration: InputDecoration(
                            suffixIcon:cubit.isshow
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),

                          ),
                          onTap: () {
                            cubit.show();
                          },
                          obscureText: cubit.isshow,
                        ),
                        SizedBox(height: 20,),
                        Text("by continuning you agree to our Terms of services and privacy policy",style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 20,),
                        button("Sign up", () {cubit.makeregister(namecontroller.text, emailcontroller.text, passwordcontroller.text, context) ;}),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                            }, child: Text("Sign up",style: TextStyle(color: Color(0xff53B175)),))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
          );
        } ,

      ),
    );
  }
}
