import 'package:flutter/material.dart';

class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '404 - Página no encontrada',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold
        ),
      )
    );
  }
}