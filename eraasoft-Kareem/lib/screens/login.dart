import 'package:eraasoftproject/screens/sign%20up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/button.dart';
import '../network/cubit/cubit.dart';
import '../network/cubit/states.dart';


class login extends StatelessWidget {
  login({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appcubit(),
      child: BlocConsumer<appcubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = appcubit.get(context);
          return Scaffold(
              body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child:
                            Image(image: AssetImage("assets/Group.png"))),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Loging",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter your email and password",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text("Email"),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller:cubit. emailcontroller,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("password"),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: cubit.passwordcontroller,
                      decoration: InputDecoration(
                        suffixIcon: cubit.isshow
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      obscureText: cubit.isshow,
                      onTap: () {
                        cubit.show();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Forget password?",
                              style: TextStyle(color: Colors.black),
                            ))),
                    SizedBox(
                      height: 20,
                    ),
                    button("Sign in", () {
                      cubit.makeLogin(cubit.emailcontroller.text, cubit.passwordcontroller.text, context);
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signup()));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(color:
                              Color(0xff53B175)),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
