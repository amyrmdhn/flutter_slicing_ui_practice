import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class BMIToggleSwitch extends StatelessWidget {
  const BMIToggleSwitch({
    super.key,
    required this.isFemale,
    required this.onToggle,
  });

  final int isFemale;
  final void Function(int? index)? onToggle;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black26,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: ToggleSwitch(
        activeBorders: [
          Border.all(
            color: Colors.black26,
            width: 1.3,
          ),
        ],
        minHeight: 50,
        minWidth: (MediaQuery.of(context).size.width * 0.439),
        cornerRadius: 20.0,
        // customWidths: [157, 157],
        activeBgColors: const [
          [Colors.white38],
          [Colors.white38]
        ],
        activeFgColor: const Color(0xFFff5151),
        inactiveBgColor: Colors.white,
        inactiveFgColor: Colors.black,
        initialLabelIndex: isFemale,
        totalSwitches: 2,
        labels: const ['Male', 'Female'],
        customTextStyles: const [
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )
        ],
        radiusStyle: true,
        onToggle: onToggle,
      ),
    );
  }
}
