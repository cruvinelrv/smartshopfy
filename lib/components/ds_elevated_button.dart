import 'package:flutter/material.dart';

class DsElevatedButton extends StatelessWidget {
  const DsElevatedButton({
    Key? key,
    required this.label,
    this.sideIcon,
    this.textIcon,
    this.callback,
    this.borderRadius,
  }) : super(key: key);

  final String label;
  final IconData? sideIcon;
  final Widget? textIcon;
  final VoidCallback? callback;
  final double? borderRadius;

  factory DsElevatedButton.proceed({VoidCallback? callback}) =>
      DsElevatedButton(
        label: 'Proceed',
        sideIcon: Icons.arrow_forward_rounded,
        callback: callback,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: _buildButton(),
    );
  }

  ElevatedButton _buildButton() {
    if (textIcon != null) return _buildWithTextIcon;
    if (sideIcon != null) return _buildWithSideIcon;
    return _buildWithTextOnly;
  }

  ElevatedButton get _buildWithTextOnly => ElevatedButton(
        onPressed: callback,
        style: _style,
        child: Text(label),
      );

  ElevatedButton get _buildWithSideIcon => ElevatedButton(
        onPressed: callback,
        style: _style,
        child: Row(
          mainAxisAlignment: sideIcon != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Text(label),
            Icon(sideIcon),
          ],
        ),
      );

  ElevatedButton get _buildWithTextIcon => ElevatedButton.icon(
        onPressed: callback,
        style: _style,
        icon: textIcon!,
        label: Text(label),
      );

  ButtonStyle? get _style {
    if (borderRadius != null) {
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      );
    }
    return null;
  }
}
