import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.body}); // and maybe other Scaffold properties

  final Widget body;
  final LinearGradient gradient = const LinearGradient(colors: [Color(0xff213048), Color(0xff432148)],
       begin:  Alignment.topLeft,
       end:  Alignment.bottomRight,
   );

  @override
  Widget build(BuildContext context) {
      return Scaffold(
         body: Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(gradient: gradient), child: SafeArea(child: body)),
         
      );
  }
}