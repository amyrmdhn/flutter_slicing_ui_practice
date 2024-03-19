import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';

class CardNumberPicker extends StatelessWidget {
  const CardNumberPicker({
    super.key,
    required this.currentValue,
    required this.onSelectPicker,
    required this.onIncrementNumber,
    required this.onDecrementNumber,
    required this.titleText,
    required this.widthScale,
    this.titleTextStyle,
    this.unitText,
    this.color,
    this.buttonColor,
    this.width,
    this.height,
    this.maxValue,
    this.itemCount,
    this.hasRuler = false,
  });

  /// Should this Card Number Picker has Ruler SVG?
  final bool hasRuler;

  /// Width
  final double? width;

  /// Height
  final double? height;

  /// Scale for sizing width number picker
  final double widthScale;

  /// Title Text
  final String titleText;

  /// Title Text Style
  final TextStyle? titleTextStyle;

  /// Unit Text
  final String? unitText;

  /// The current value selected
  final int currentValue;

  /// Item count to visible
  final int? itemCount;

  /// Max value of ruler
  final int? maxValue;

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
      padding: EdgeInsets.fromLTRB(16, 16, 16, !hasRuler ? 16 : 0),
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
          LayoutBuilder(builder: (context, constraints) {
            double width = constraints.maxWidth * widthScale;
            return NumberPicker(
              itemWidth: width,
              itemCount: itemCount ?? 3,
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
              maxValue: maxValue ?? 250,
              onChanged: onSelectPicker,
            );
          }),
          const SizedBox(height: 12),
          //* Show ruler if hasRuler is true
          if (hasRuler)
            LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth;
                return SvgPicture.asset(
                  'assets/ruler.svg',
                  width: width * 0.9,
                  colorFilter:
                      const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
                );
              },
            ),
          //* Show Action Button if hasRuler is false
          if (!hasRuler)
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
