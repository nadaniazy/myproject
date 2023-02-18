import 'package:eraasoftproject/screens/login.dart';
import 'package:flutter/material.dart';
import '../model/account_model.dart';

class Accounts extends StatelessWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?size=626&ext=jpg&uid=R86676578&ga=GA1.2.1191164273.1660582878&semt=sph"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nada Niazy",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            Icons.mode_edit_outlined,
                            color: Color(0xff53B175),
                            size: 20,
                          ),
                        ],
                      ),
                      Text(
                        "nadaniazy22@gmail.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade300,
              ),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(details[index].iconData),
                        title: Text(
                          details[index].text ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        trailing: Icon(details[index].icon),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
                      );
                    },
                    itemCount: details.length),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login(),
                          ),
                          (route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(23.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            color: Color(0xff53B175),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Log Out",
                            style: TextStyle(
                                color: Color(0xff53B175), fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
