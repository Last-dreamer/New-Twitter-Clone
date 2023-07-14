
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.mainHorizontalPadding,
    required this.theme,
    required this.text,
      this.onTap
  });

  final Function()? onTap;
  final double width;
  final double mainHorizontalPadding;
  final ThemeData theme;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: width * mainHorizontalPadding * 2),
        child: MaterialButton(onPressed: onTap,
          shape: const StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: width * .04),
          color: theme.colorScheme.secondary,
          child: Text(text, style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),),));
  }
}

