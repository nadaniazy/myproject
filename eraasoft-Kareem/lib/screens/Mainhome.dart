import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/cubit/cubit.dart';
import '../network/cubit/states.dart';

class Mainhome extends StatelessWidget {
  const Mainhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>appcubit(),
      child: BlocConsumer<appcubit,appstates>(
        listener:(context,state){} ,
        builder:(context,state){
          var cubit=appcubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                cubit.changepages(index);
              },
              items: cubit.items,
              currentIndex: cubit.currentindex,
              selectedItemColor: Color(0xff53B175),
              unselectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              iconSize: 25,
            ),
            body: cubit.screens[cubit.currentindex],
          );
        } ,

      ),
    );
  }
}
