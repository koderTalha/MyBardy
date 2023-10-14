import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
   CustomAppbar({
    required this.title,
    this.barcolor,
    this.centertitle,
    required this.actions,
  });


  final String title;
  final Color? barcolor;
  final bool? centertitle;
  final Widget actions;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: barcolor,
        centerTitle: centertitle,
        actions: [actions],
      ),
    );
  }
}
