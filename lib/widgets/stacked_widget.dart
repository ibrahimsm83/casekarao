import 'package:flutter/cupertino.dart';

class Stackedwidget extends StatelessWidget {
  final List<dynamic> items;
  final double size;
  final double xShift;
  final TextDirection direction;

  const Stackedwidget({
    Key? key,
    required this.items,
    this.size = 100,
    this.xShift = 20,
    this.direction = TextDirection.ltr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems =
        items
            .asMap()
            .map((index, item) {
              final left = size - xShift;
              final value = Container(
                width: size,
                height: size,
                child: item,
                margin: EdgeInsets.only(left: left * index),
              );
              return MapEntry(index, value);
            })
            .values
            .toList();
    return Stack(
      children:
          direction == TextDirection.ltr
              ? allItems.reversed.toList()
              : allItems,
    );
  }
}
