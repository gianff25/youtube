import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {


    return Container(
      
      width: 280,
      height: 300,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          Container(
            height: 190,
            width: 280,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)

            ),
          ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: 50,
                  height: 110,
                  child: Align(alignment: Alignment.topCenter, child: CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person_outline, color: Colors.black.withOpacity(0.5), size: 30,))),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  color: Colors.transparent,
                  height: 110,
                  width: 230,
                  child: Column(
                    children: [
                      
                      const Align(alignment: Alignment.centerLeft, child: Text('Titulo del video', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,  
                      )),
                      Align(alignment: Alignment.centerLeft, child: Text('Autor', style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.8)))),
                      Align(alignment: Alignment.centerLeft, child: Text('Número de reproducciones', style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.8)))),
                    ],
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}