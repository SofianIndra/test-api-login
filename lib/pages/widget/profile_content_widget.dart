import 'package:flutter/material.dart';

class ProfileContentWidget extends StatelessWidget {
  final String title;
  final String content;
  const ProfileContentWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 16,
      ),
      child: Column(
        children: [
          Text(title),
          Text(
            content,
          ),
        ],
      ),
    );
  }
}
