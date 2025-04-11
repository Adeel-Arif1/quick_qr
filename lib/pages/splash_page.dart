import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/bottom_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 190.0),
              child: SizedBox(
                height: 200, width: 200,

                child: Image(image: AssetImage('assets/splash_qrr.png')),
                //Image  AssetImage('assets/background.png'),
              ),
            ),
          ),
          SizedBox(height: 220),
          Text(
            'Go and enjoy our features for free\nand make your life easy!!!',
            style: TextStyle(fontSize: 18, color: Colors.white,fontStyle: FontStyle.italic
            ),
          ),
          SizedBox(height: 30),
          RoundedButton(
            label: 'Lets Start',
            onPressed: () { Navigator.pushNamed(context, '/qrscanner');},
          ),


        ],
      ),
    );
  }
}
