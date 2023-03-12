import 'package:flutter/material.dart';

// TODO перенести состояние на виджет Book card widget. Использовать bloc
// добавить параметр selected
// ресерч анимации + bloc
class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({Key? key}) : super(key: key);

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget>
    with SingleTickerProviderStateMixin {
  static const Color _color = Color(0xFFFF2D20);
  static const double _size = 24;

  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 100), vsync: this, value: 1.0);

  bool _selected = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
        _controller.reverse().then((value) => _controller.forward());
      },
      child: ScaleTransition(
        scale: Tween(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.linear)),
        child: _selected
            ? const Icon(
                Icons.favorite,
                size: _size,
                color: _color,
              )
            : const Icon(Icons.favorite_border, size: _size, color: _color),
      ),
    );
  }
}
