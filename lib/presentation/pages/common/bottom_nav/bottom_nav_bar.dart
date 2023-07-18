import 'package:flutter/material.dart';

class LampBottomNavigationBar extends StatefulWidget {
  final double iconSize, width;
  final List<IconData> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

     const LampBottomNavigationBar({super.key, 
    this.iconSize = 24,
    this.items = const <IconData>[],
    required this.width,
    required this.onTap,
    this.currentIndex = 0,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LampBottomNavigationBarState createState() =>
      _LampBottomNavigationBarState();
}

class _LampBottomNavigationBarState extends State<LampBottomNavigationBar>
    with SingleTickerProviderStateMixin {

  int oldIndex = 0;
  late AnimationController _controller;
  double width = 0.0;

  @override
  initState() {
    super.initState();
    _resetState();
  }

  _resetState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      reverseDuration:const  Duration(milliseconds: 400),
    );
    _controller.forward();
    width = widget.width;
  }

  _buildNavigationTile() {
    var tiles = <Widget>[];
    for (int i = 0; i < widget.items.length; i++) {
      tiles.add(
        InkWell(
          onTap: () {
            if (widget.onTap != null) widget.onTap(i);
          },
          child: LampNavigationBarTile(
            key: UniqueKey(),
            icon: widget.items[i],
            active: i == widget.currentIndex,
            wasActive: i == oldIndex,
            animation: _controller, onTap: () {  },
          ),
        ),
      );
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(12,5)
          )
        ],
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _controller,
            builder: (_, w) {
              return SizedBox(
                height: 56,
                width: width,
                child: CustomPaint(
                  foregroundPainter: _SelectedTilePainter(
                      newPosition: widget.currentIndex,
                      oldPosition: oldIndex,
                      progress: Tween<double>(begin: 0.0, end: 1.0)
                          .animate(CurvedAnimation(
                              parent: _controller,
                              curve:
                                 const Interval(0.0, 0.5, curve: Curves.easeInOut)))
                          .value,
                      count: widget.items.length),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[..._buildNavigationTile()],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class LampNavigationBarTile extends StatelessWidget {
  final IconData icon;
  final bool active, wasActive;
  final double iconSize;
  final Animation<double> animation;
  final VoidCallback onTap;

  LampNavigationBarTile({
    Key? key,
    required this.icon,
    required this.animation,
    this.iconSize = 24,
    required this.onTap,
    this.active = false,
    this.wasActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 60,
      width: iconSize + 24,
      child: Stack(
        children: [
          Center(
            child: Icon(
              icon,
              size: iconSize,
              color: active ? theme.colorScheme.secondary : Colors.white,
            ),
          ),
          FadeTransition(
            opacity: ((active)
                ? Tween<double>(begin: 0, end: 1).animate(
                    CurvedAnimation(
                        parent: animation,
                        curve: const Interval(0.6, 1, curve: Curves.easeInOut)),
                  )
                : Tween<double>(begin: 1, end: 0).animate(
                    CurvedAnimation(
                        parent: animation,
                        curve: const Interval(0, 0.4, curve: Curves.easeInOut)),
                  )),
            child: CustomPaint(
              foregroundPainter:
              _LightLampPainter(active: active || wasActive),
            ),
          )
        ],
      ),
    );
  }
}

class _SelectedTilePainter extends CustomPainter {
  _SelectedTilePainter({
   required  this.oldPosition,
   required this.newPosition,
   required this.progress,
   required this.count,
     this.iconSize = 24,
     this.color = Colors.white,
  }) {
    assert(progress != null);
  }

  final int oldPosition, newPosition, count;
  final double iconSize;
  final Color color;
  final double progress;

  Offset startOffset(Size size) {
    var freeSpace = (size.width / count) - iconSize;
    assert(freeSpace >= 0);
    return Offset(
        freeSpace / 2 +
            (freeSpace + iconSize) *
                (oldPosition * (1 - progress) + newPosition * progress),
        1);
  }

  Offset endOffset(Size size) {
    var freeSpace = (size.width / count) - iconSize;
    assert(freeSpace >= 0);
    return Offset(
        freeSpace / 2 +
            (freeSpace + iconSize) *
                (oldPosition * (1 - progress) + newPosition * progress) +
            iconSize,
        1);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var p = Paint()
      ..color = color
      ..strokeWidth = 2;
    canvas.drawLine(startOffset(size), endOffset(size), p);
  }

  @override
  bool shouldRepaint(_SelectedTilePainter oldDelegate) => true;
}

class _LightLampPainter extends CustomPainter {
  final bool active;
  final double iconSize;
  final Color color;
  final Animation? animation;

  _LightLampPainter({
    required this.active,
    this.animation,
    this.iconSize = 24,
    this.color = Colors.white,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (active) {
      var p = Paint()
        ..shader = LinearGradient(colors: <Color>[
          color.withAlpha(64),
          color.withAlpha(24),
          color.withAlpha(0)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            .createShader(
         const Rect.fromLTWH(0, 0, 90, 56),
        );
      var oldTrap = Path()..addPolygon(getTrap(size), true);
      canvas.drawPath(oldTrap, p);
    }
  }

  @override
  bool shouldRepaint(_LightLampPainter oldDelegate) => true;

  List<Offset> getTrap(Size size, {Offset initial = Offset.zero}) {
    var points = <Offset>[];
    points.add(initial + const Offset(15, 0));
    points.add(initial + const Offset(-14, 56));
    points.add(initial + const Offset(65, 60));
    points.add(initial + const Offset(34, 0));
    return points;
  }
}
