import 'package:flutter/material.dart';
import '/model/core_state.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({
    super.key,
    required this.child,
  });

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  CoreState state = const CoreState();

  // @override
  // void initState() {
  //   super.initState();
  //   print('initState');
  // }

  // @override
  // void didUpdateWidget(oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   print('didUpdate');
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   print('didChange');
  // }

  // @override
  // void deactivate() {
  //   super.deactivate();
  //   print('deactivate');
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   print('dispose');
  // }

  void incrementCounter() {
    final counter = state.counter + 1;
    final newState = state.copy(counter: counter);

    setState(() => state = newState);
  }

  void setColor(Color backgroundColor) {
    final newState = state.copy(backgroundColor: backgroundColor);

    setState(() => state = newState);
  }

  void setCounter(int counter) {
    final newState = state.copy(counter: counter);

    setState(() => state = newState);
  }

  @override
  Widget build(BuildContext context) => StateInheritedWidget(
        state: state,
        stateWidget: this,
        child: widget.child,
      );
}

class StateInheritedWidget extends InheritedWidget {
  final CoreState state;
  final State<StateWidget> stateWidget;

  const StateInheritedWidget({
    super.key,
    required super.child,
    required this.state,
    required this.stateWidget,
  });

  static of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!
      .stateWidget;

  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) =>
      oldWidget.state != state;
}
