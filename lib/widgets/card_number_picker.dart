import 'package:flutter/material.dart';
//* Must add third package called 'Number Picker' on pub.dev
import 'package:numberpicker/numberpicker.dart';

class CardNumberPicker extends StatelessWidget {
  const CardNumberPicker({
    super.key,
    required this.currentValue,
    required this.onSelectPicker,
    required this.onIncrementNumber,
    required this.onDecrementNumber,
    required this.titleText,
    this.titleTextStyle,
    this.unitText,
    this.color,
    this.buttonColor,
    this.width,
    this.height,
  });

  /// Width
  final double? width;

  /// Height
  final double? height;

  /// Title Text
  final String titleText;

  /// Title Text Style
  final TextStyle? titleTextStyle;

  /// Unit Text
  final String? unitText;

  /// The current value selected
  final int currentValue;

  /// The current value selected color
  final Color? color;

  final Color? buttonColor;

  /// Called when selected value changes
  final void Function(int number) onSelectPicker;

  /// Called when selected value changes from button -- Minus
  final void Function() onIncrementNumber;

  /// Called when selected value changes from button ++ Plus
  final void Function() onDecrementNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black26,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //* Title Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleText,
                style: titleTextStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
              ),
              const SizedBox(width: 4),
              if (unitText != null)
                Text(
                  unitText!,
                  style: titleTextStyle ??
                      const TextStyle(
                        color: Colors.black45,
                      ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          //* Number Picker Slider
          NumberPicker(
            itemWidth: 50,
            textStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
            ),
            selectedTextStyle: TextStyle(
              color: color ?? const Color(0xFFff5151),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            axis: Axis.horizontal,
            value: currentValue,
            minValue: 0,
            maxValue: 100,
            onChanged: onSelectPicker,
          ),
          const SizedBox(height: 12),
          //* Action Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onIncrementNumber,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor ?? Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 3,
                  shape: const CircleBorder(),
                  minimumSize: const Size(25, 25),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Icon(
                  Icons.add,
                  size: 14,
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: onDecrementNumber,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor ?? Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 3,
                  shape: const CircleBorder(),
                  minimumSize: const Size(25, 25),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Icon(
                  Icons.remove,
                  size: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
