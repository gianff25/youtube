import 'package:flutter/material.dart';

class SidebarButton extends StatefulWidget {
  final Function onPressed;
  final IconData icon;
  final String label;
  final bool? iconRight;
  final double? iconSize;

  const SidebarButton({super.key,  required this.icon, required this.label, required this.onPressed, this.iconRight = false, this.iconSize});

  @override
  State<SidebarButton> createState() => _SidebarButtonState();
}

class _SidebarButtonState extends State<SidebarButton> {
    
  bool isHover = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHover = true ),
      onExit: (_) => setState(() => isHover = false),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: const BorderSide(color: Colors.transparent),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          backgroundColor: isHover ? Colors.green.withOpacity(0.1) : Colors.transparent
        ),
        child: Stack(
          children: [
            widget.iconRight! ?
              Row(
                children: [
                  Text(widget.label, style: const TextStyle(fontSize: 12, color: Colors.white), overflow: TextOverflow.ellipsis, softWrap: true),
                  const SizedBox(width: 20),
                  Icon(widget.icon,color: Colors.white, size: widget.iconSize ?? 20,),
                ],
              ) : Row(
                children: [
                  Icon(widget.icon,color: Colors.white, size: widget.iconSize ?? 20,),
                  const SizedBox(width: 20),
                  Text(widget.label, style: const TextStyle(fontSize: 12, color: Colors.white), overflow: TextOverflow.ellipsis, softWrap: true),
                ],
              )
          ],
        ),
        onPressed: () => widget.onPressed(), 
      ),
    );
  }
}