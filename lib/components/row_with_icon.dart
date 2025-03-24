import 'package:flutter/material.dart';

class RowWithIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback? onTap;

  const RowWithIcon({super.key, required this.icon, required this.color, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(icon, color: color, size: 18),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16, color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}