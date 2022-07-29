import 'package:flutter/material.dart';
import '../models/app_state.dart';

class StateInheritedWidget extends InheritedWidget {
  const StateInheritedWidget({
    Key? key,
    required this.state,
    required this.stateWidget,
    required super.child,
  }) : super(
          key: key,
        );
  final AppState state;
  final StateWidgetState stateWidget;
  static StateWidgetState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!
      .stateWidget;
  @override
  bool updateShouldNotify(covariant StateInheritedWidget oldWidget) =>
      oldWidget.state != state;
}

class StateWidget extends StatefulWidget {
  const StateWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<StateWidget> createState() => StateWidgetState();
}

class StateWidgetState extends State<StateWidget> {
  AppState state = AppState();

  void incrementCounter() {
    final counter = state.counter + 1;
    final newState = state.copyWith(counter: counter);

    setState(() => state = newState);
  }

  void changeColor(MaterialColor newPrimarySwatch) {
    final AppState newState = state.copyWith(primarySwatch: newPrimarySwatch);

    setState(() => state = newState);
  }

  @override
  Widget build(BuildContext context) => StateInheritedWidget(
        state: state,
        stateWidget: this,
        child: widget.child,
      );
}
