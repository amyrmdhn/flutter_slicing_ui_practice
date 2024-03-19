import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  /// Called when button tapped
  final void Function() onPressed;

  /// Icon on button
  final IconData icon;

  /// Text bellow button
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(70),
          topLeft: Radius.circular(70),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black26,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFfb5253),
                foregroundColor: Colors.white,
                shape: const CircleBorder(),
                minimumSize: const Size(75, 75),
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFFfb5253),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
