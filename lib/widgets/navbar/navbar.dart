import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  bool isHover = false;
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.06,
      color: Colors.black.withOpacity(0.95),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Stack(
        children: [
          
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
              
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => isHover = true),
                  onExit: (_) => setState(() => isHover = false),
                  child: IconButton(
                    icon: Icon(Icons.menu_outlined, color: Colors.white.withOpacity(0.6)),
                    onPressed: (){},
                  )
                ),
              
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'youtube.png',
                      )
                    ],
                  ),
                  onPressed: (){} 
                )
              ],

            ),
          ),

          Center(
             child: Container(
              width: size.width * 0.4, // Ajusta el ancho según tus necesidades
              height: size.height * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white.withOpacity(0.2))
              ),
              child: Row(
                children: [

                  Flexible(
                    flex: 8,
                    child: TextField(
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                      decoration: InputDecoration(
                        hintText: 'Buscar',
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100))
                        ),
                        contentPadding: const EdgeInsets.only(top: 10, left: 20)
                      ),
                    ),
                  ),

                  Flexible(flex: 1, child: Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.05), 
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(100), bottomRight: Radius.circular(100))
                    ), 
                    child: Align(alignment: Alignment.centerRight, child: IconButton(icon: const Icon(Icons.search_outlined, color: Colors.white), onPressed: (){}))))
                ],
              ),
            )
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                IconButton(icon: const Icon(Icons.upload_outlined, color: Colors.white,), onPressed: (){}),

                IconButton(icon: const Icon(Icons.notifications_outlined, color: Colors.white,), onPressed: (){}),

                CircleAvatar(backgroundColor: Colors.white, child: IconButton(icon: Icon(Icons.person_outline, color: Colors.black.withOpacity(0.5),), onPressed: (){})),

              ],
            ),
          )
        ],
      ),
    );
  }
}