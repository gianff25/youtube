import 'package:flutter/material.dart';
import 'package:youtube/router/router.dart';
import 'package:youtube/service/navigation_service.dart';
import 'package:youtube/widgets/sidebar/sidebar_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {

  bool mostrarMas = false;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Container(
      width: size.width * 0.10,
      height: size.height * 0.94,
      decoration: buildBoxDecoration(),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        children: [
          SidebarButton(
            icon: Icons.home,
            label: 'Inicio',
            onPressed: (){
              NavigationService.navigateTo(Flurorouter.rootRoute);
            },
          ),

          SidebarButton(
            icon: Icons.record_voice_over_outlined,
            label: 'Shorts',
            onPressed: (){
              NavigationService.navigateTo('/asfas');
            }
          ),

          SidebarButton(
            icon: Icons.gif_box_outlined, 
            label: 'Suscripciones',
            onPressed: () {}
          ),

          const Divider(),

          SidebarButton(
            icon: Icons.arrow_forward_ios_outlined, 
            label: 'Tú', 
            onPressed: (){},
            iconRight: true,
            iconSize: 12,
          ),

          SidebarButton(
            icon: Icons.person_pin_outlined, 
            label: 'Tu canal', 
            onPressed: (){},
          ),

          SidebarButton(
            icon: Icons.history_outlined, 
            label: 'Historial', 
            onPressed: (){},
          ),

          SidebarButton(
            icon: Icons.ondemand_video_outlined, 
            label: 'Mas Vídeos', 
            onPressed: (){},
          ),

          SidebarButton(
            icon: Icons.timelapse_outlined, 
            label: 'Ver más tarde', 
            onPressed: (){},
          ),

          SidebarButton(
            icon: Icons.content_cut_outlined, 
            label: 'Tus clips', 
            onPressed: (){},
          ),

          if(mostrarMas)
            Column(
              children: [

                SidebarButton(
                  icon: Icons.thumb_up_alt_outlined, 
                  label: 'Videos que me gustan', 
                  onPressed: (){},
                ),
                
                SidebarButton(
                  icon: Icons.list_outlined, 
                  label: 'Listas de reprodicción', 
                  onPressed: (){},
                ),
                
              ],
            ),

          SidebarButton(
            icon: mostrarMas ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined, 
            label: mostrarMas ? 'Mostrar menos' : 'Mostrar mas', 
            onPressed: (){
              setState(() {
                mostrarMas = !mostrarMas;
              });
            },
          ),

          const Divider(),

          const Text('Suscripciones', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),

          SidebarButton(
            icon: Icons.person_outline, 
            label: 'Persona 1', 
            onPressed: (){},
          ),

          SidebarButton(
            icon: Icons.person_outline, 
            label: 'Persona 2', 
            onPressed: (){},
          ),

        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.black.withOpacity(0.95),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 5
      )
    ]
  );
}