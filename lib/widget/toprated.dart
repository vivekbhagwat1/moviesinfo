import 'package:flutter/material.dart';
import 'package:movies_info/utis/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Modified_text(
          text: 'Toprated Movies',
          size: 26,
        ),
        SizedBox(height: 10,),
        Container(
          height: 290,
          
          child: ListView.builder(
              itemCount: toprated.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    child: Column(children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                            )
                            )),
                      ),
                      Container(child: Modified_text(text: toprated[index]['title']!=null?
                     toprated[index]['title']:'Loading' ),)
                    ]),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
