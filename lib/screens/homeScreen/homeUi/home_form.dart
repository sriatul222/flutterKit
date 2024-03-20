import 'package:club/widgets/common_appbar_widget.dart';
import 'package:flutter/material.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Home Page', appBar: AppBar(),iconButton: false),
      body: const Center(
        child: Text('Home Tab Screen', style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
