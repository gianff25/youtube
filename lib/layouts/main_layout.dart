import 'package:flutter/material.dart';
import 'package:youtube/views/home_view.dart';
import 'package:youtube/widgets/navbar/navbar.dart';
import 'package:youtube/widgets/sidebar/sidebar.dart';

class MainLayout extends StatelessWidget {

  final Widget child;
  const MainLayout({super.key, required this.child});
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: Navbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.06),
        height: size.height,
        width: size.width,
        child: Row(
          children: [
            const Expanded(flex: 1, child: SideBar()),
            Expanded(flex: 9, child: child)
          ],
        )
      ),
    );
  }
}