


import 'package:flutter/cupertino.dart';

class SelectedColor extends StatefulWidget {
  SelectedColor({Key? key, this.defaultOpacity = 0.0, required this.child}) : super(key: key);
    double defaultOpacity;
    final Widget child;

  @override
  State<SelectedColor> createState() => _SelectedState();
}

class _SelectedState extends State<SelectedColor> {
  @override
  Widget build(BuildContext context) {


    return Listener(
      onPointerUp: (_) => setState(() {  widget.defaultOpacity = 0.0; }),
      onPointerDown:  (_) => setState(() { widget.defaultOpacity = 1.0; }),
      child: Opacity(
        opacity: widget.defaultOpacity,
        child: widget.child,
      ),
    );
  }
}
