import 'package:flutter/material.dart';

class PhoneState extends StatefulWidget {
  PhoneState({Key? key, required this.child}) : super(key: key);
  final Widget child;

  static void rebuild(BuildContext context) {
    context.findAncestorStateOfType<_PhoneStateState>()!.restartApp();
  }

  @override
  State<PhoneState> createState() => _PhoneStateState();
}

class _PhoneStateState extends State<PhoneState> {

  Key _key = UniqueKey();

  void restartApp() {
   setState(() {
     _key = UniqueKey();
   });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: widget.child,
    );
  }
}
