import 'package:flutter/material.dart';

class HeroBtnWidget extends StatefulWidget {
  final VoidCallback action;
  final String title;
  const HeroBtnWidget({super.key, required this.action, required this.title});

  @override
  State<HeroBtnWidget> createState() => _HeroBtnWidgetState();
}

class _HeroBtnWidgetState extends State<HeroBtnWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.action, child: Text(widget.title));
  }
}
