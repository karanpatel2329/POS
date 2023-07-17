import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/image_path.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagePath.welcomeScreenImage, height: 255, width: 340,),
          const SizedBox(height: 32,),
          FloatingActionButton(onPressed: (){}, child: Text('a'),)
        ],
      ),
    );
  }
}
