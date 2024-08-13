import 'package:flutter/material.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';

class MainScaffold extends StatelessWidget {
  final myAppBar;
  final bodyContainer;

  const MainScaffold({super.key, this.myAppBar, this.bodyContainer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: MyColors.bgWhite,
      appBar: myAppBar,
      body: SingleChildScrollView(child: bodyContainer),
    );
  }
}
