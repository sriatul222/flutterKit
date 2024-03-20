import 'package:club/widgets/common_appbar_widget.dart';
import 'package:flutter/material.dart';

class FavoriteForm extends StatelessWidget {
  const FavoriteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CommonAppBar(title: 'Favorite Page', appBar: AppBar(),iconButton: false),
      body: const Center(
        child: Text('Favorite Tab Screen',style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
