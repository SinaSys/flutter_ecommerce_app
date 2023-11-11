import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset('assets/images/profile_pic.png')),
          const Text(
            "Hello Sina!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/github.png', width: 60),
              const SizedBox(width: 10),
              const Text(
                "https://github.com/SinaSys",
                style: TextStyle(fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}
