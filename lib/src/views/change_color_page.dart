import 'package:flutter/material.dart';
import '../controller/state_widgets.dart';

class ChangeColorPage extends StatelessWidget {
  const ChangeColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MaterialColor> availableColors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.amber,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Color'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: availableColors
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ColorItem(
                      color: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}


class ColorItem extends StatelessWidget {
  final MaterialColor color;

  const ColorItem({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = StateInheritedWidget.of(context);
    return InkWell(
      onTap: () {
        state.changeColor(color);
        Navigator.of(context).pop();
      },
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
        ),
      ),
    );
  }
}