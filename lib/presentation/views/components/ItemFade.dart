import 'package:flutter/cupertino.dart';

class ItemFade extends StatefulWidget {
  final int index;
  final AnimationController animationController;
  final double duration;
  final Widget child;

  ItemFade({this.index, this.animationController, this.duration, this.child});

  @override
  _ItemFade createState() => _ItemFade();
}

class _ItemFade extends State<ItemFade> {
  Animation _animation;
  double start;
  double end;

  @override
  void initState() {
    super.initState();
    start = (widget.duration * widget.index).toDouble();
    end = start + widget.duration;
    print("START $start , end $end");
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          start,
          end,
          curve: Curves.easeIn,
        ),
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: _animation.value,
        duration: Duration(milliseconds: widget.duration.toInt()),
        child: widget.child);
  }
}
