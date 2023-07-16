
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/presentation/pages/auth/widgets/cubit/show_password.dart';


class CustomTextField extends StatefulWidget {
    const CustomTextField({
    super.key,
    required this.width,
    required this.theme,
    required this.hintText,
      required this.onTap,
      required this.iconData,
      this.obscure = false,
      this.showBackgroundColor = false,
      required this.controller
  });

    final TextEditingController controller;
    final VoidCallback onTap;
  final double width;
  final ThemeData theme;
  final String hintText;
  final IconData iconData;
  final bool obscure;
  final bool showBackgroundColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with SingleTickerProviderStateMixin {
  double borderRadius = 15;
  late AnimationController _animationController;
  late Animation<Offset> _animation;
 
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutQuad));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showBackgroundColor) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Hero(
        tag: "background_color",
        child: Container(
        
          padding: EdgeInsets.symmetric(vertical: widget.width * .03, horizontal: widget.width * .03),
          decoration: BoxDecoration(
              color: widget.showBackgroundColor ?
               widget.theme.colorScheme.primaryContainer : Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius)
          ),
          child: TextFormField(
            controller: widget.controller,
            onTap: widget.onTap,
            obscureText: widget.obscure ? context.watch<ShowPasswordCubit>().state : false,
            style: widget.theme.textTheme.bodyLarge,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: widget.width * .03),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                labelText: widget.hintText,
                labelStyle: widget.theme.textTheme.titleLarge,
                isCollapsed: true,
                icon: Icon(widget.iconData, color: widget.theme.iconTheme.color,),
                suffixIcon:  widget.obscure ? returnEyeIcon(context) : null
            ),
          ),
        ),
      ),
    );
  }

  Widget returnEyeIcon(BuildContext context){
    return BlocBuilder<ShowPasswordCubit, bool>(
      builder: (context, state) {
        if(state){
          return GestureDetector(
              onTap: (){
                context.read<ShowPasswordCubit>().changeIcon();
              },
              child: Icon(Icons.remove_red_eye, color: widget.theme.iconTheme.color));
        }else{
          return GestureDetector(
              onTap: (){
                context.read<ShowPasswordCubit>().changeIcon();
              },
              child: Icon(Icons.visibility_off, color: widget.theme.iconTheme.color));
        }
      }
    );
  }
}