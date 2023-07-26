import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'SUCCESS',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}
