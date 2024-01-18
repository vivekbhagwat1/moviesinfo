import 'package:flutter/material.dart';
import 'package:movies_info/utis/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Modified_text(
          text: 'Popular TV Shows',
          size: 26,
        ),
        SizedBox(height: 10,),
        Container(
          height: 200,
          
          child: ListView.builder(
              itemCount: tv.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 200,
                    child: Column(
                      children: [
                      Container(
                        
                        width: 200,
                        height: 140,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                            ),fit: BoxFit.cover
                            )),
                      ),
                      SizedBox(height: 10,),
                      Container(child: Modified_text(text: tv[index]['original_name']!=null?
                     tv[index]['original_name']:'Loading' ),)
                    ]),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
