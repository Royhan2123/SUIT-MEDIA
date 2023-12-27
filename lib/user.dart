import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(""),),
            ),
          ),
          const SizedBox(width: 20,),
          Column(
            children: [
                Text("Name"),
                Text("Gmail"),
            ],
          )
        ],
      ),
    );
  }
}