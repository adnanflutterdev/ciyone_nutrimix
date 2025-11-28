import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';

class AnimationIcon extends StatefulWidget {
  const AnimationIcon({
    super.key,
    required this.initialIcon,
    required this.finalIcon,
    this.size = 16,
    this.duration = const Duration(milliseconds: 400),
    required this.onChanged,
  });

  final String initialIcon;
  final String finalIcon;
  final double size;
  final Duration duration;
  final ValueChanged<bool> onChanged;

  @override
  State<AnimationIcon> createState() => _AnimatedIconSwitcherState();
}

class _AnimatedIconSwitcherState extends State<AnimationIcon> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.duration,
      transitionBuilder: (child, animation) {
        return RotationTransition(
          turns: Tween<double>(begin: 0.75, end: 1).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: GestureDetector(
        key: ValueKey<bool>(_isSwitched),
        onTap: () {
          setState(() {
            _isSwitched = !_isSwitched;
          });
          widget.onChanged(_isSwitched);
        },
        child: CustomIcon(
          _isSwitched ? widget.finalIcon : widget.initialIcon,
          size: widget.size,
          horzontalPadding: 8,
          verticalPadding: 8,
        ),
      ),
    );
  }
}
