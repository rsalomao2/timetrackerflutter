import 'package:flutter/material.dart';

class CustomToolBar extends StatefulWidget {
  final String title;
  final Widget screenContent;

  const CustomToolBar(this.title, this.screenContent);

  @override
  _CustomToolBarState createState() => _CustomToolBarState();
}

class _CustomToolBarState extends State<CustomToolBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.screenContent,
    );
  }
}
