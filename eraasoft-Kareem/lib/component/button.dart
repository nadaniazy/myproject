import 'package:flutter/material.dart';


class button extends StatelessWidget {
  button(this.text,this.onpressed);
  void Function()? onpressed;

  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onpressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              text,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Color(0xff53B175),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
    );
  }
}
