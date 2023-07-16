
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,

    required this.mainHorizontalPadding,
    required this.theme,
    required this.text,
    required this.shouldAnimated,
      this.onTap
  });

  final Function()? onTap;
  final double width;
  final double height;
  final double mainHorizontalPadding;
  final ThemeData theme;
  final String text;
  final bool shouldAnimated;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AnimatedContainer(
       
        decoration:   BoxDecoration(
           color: theme.colorScheme.background,
          shape: BoxShape.circle),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          width: shouldAnimated ? width /1.5 :  width,

          padding: EdgeInsets.symmetric(horizontal: width * mainHorizontalPadding * 2),
          child:  MaterialButton(onPressed: onTap,
            shape:  shouldAnimated ? const CircleBorder() : const StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: width * .04),
            color: theme.colorScheme.secondary,
            child: shouldAnimated ? Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const  CircularProgressIndicator(color: Colors.white))  
            : Text(text, style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),),
            )
            ));
    
  }
}

