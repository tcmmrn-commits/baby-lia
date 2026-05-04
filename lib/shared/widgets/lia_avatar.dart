import 'package:flutter/material.dart';

class LiaAvatar extends StatelessWidget {
  final double size;

  const LiaAvatar({
    super.key,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFFFFD7BF), Color(0xFFFFB8C8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Icon(
        Icons.child_care_rounded,
        size: size * 0.54,
        color: const Color(0xFF7C4A3A),
      ),
    );
  }
}
