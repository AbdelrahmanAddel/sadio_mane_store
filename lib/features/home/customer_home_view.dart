import 'package:flutter/material.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Customer Screen', style: TextStyle(fontSize: 50))),
        ],
      ),
    );
  }
}
