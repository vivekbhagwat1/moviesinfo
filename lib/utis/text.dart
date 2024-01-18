import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Modified_text extends StatelessWidget {
  

  final String text;
  final Color color;
  final double size;
   const Modified_text({
     
    required this.text, 
    this.color=Colors.white, 
    this.size=16.0,
    Key? key, 
    })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: GoogleFonts.roboto(color: color, fontSize: size),
    );
  }
}
