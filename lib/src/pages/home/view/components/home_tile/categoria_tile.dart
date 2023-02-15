import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.category,
    required this.isSeleted,
    required this.onPressed,
  }) : super(key: key);

  final String category;
  final bool isSeleted;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSeleted ? CustomColors.customSwatchColor : Colors.transparent,
          ),
          child: Text(
            category,
            style: TextStyle(
              color: isSeleted ? Colors.white : CustomColors.customConstrastColor,
              fontWeight: FontWeight.bold,
              fontSize: isSeleted ? 16 : 14,
            ),
          ),
        ),
      ),
    );
  }
}
