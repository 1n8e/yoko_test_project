import 'package:flutter/material.dart';
import 'package:yoko_test_project/const/text_styles.dart';

class ActiveCard extends StatelessWidget {
  final String title;
  final String image;

  const ActiveCard({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.maxFinite,
      height: 226,
      child: Text(
        title,
        style: ConstTextStyles.cardTitle,
      ),
    );
  }
}
