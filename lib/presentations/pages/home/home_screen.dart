import 'package:flutter/material.dart';
import 'package:sportify/widgets/main_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      bodyContainer: Center(
        child: Text("Home"),
      ),
    );
  }
}
