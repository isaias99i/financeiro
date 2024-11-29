import 'package:flutter/material.dart';

class TableCellWidget extends StatelessWidget {
  final String content;
  final double width;
  final double height;
  final bool isHeader;
  final Color textColor;
  final VoidCallback? onTap; //Funçaõ chamada ao clicar na célula

  const TableCellWidget({super.key, 
    required this.content,
    required this.width,
    this.height = 40,
    this.isHeader = false,
    this.textColor = Colors.black,
    this.onTap, // Clique opcional
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isHeader ? Colors.grey[300] : Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          content,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            color: textColor,
          ),
          textAlign: TextAlign.center,

        ),
      ),
    );
  }
}