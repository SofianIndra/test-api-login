import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;

  const TextfieldWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 16,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration.collapsed(
                      hintText: hintText,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
