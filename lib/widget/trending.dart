import 'package:flutter/material.dart';
import 'package:movies_info/utis/text.dart';

import '../discription.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Modified_text(
          text: 'Trending Movies',
          size: 26,
        ),
        SizedBox(height: 10,),
        Container(
          height: 290,
          
          child: ListView.builder(
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Description(name: trending[index]['title'],
                    bannerurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                    posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                    description: trending[index]['overview'],
                                      vote: trending[index]['vote_average']
                                          .toString(),
                                      launch_on: trending[index]
                                          ['release_date'],
                    )));
                  },
                  child: 
                  trending[index]['title']!=null?Container(
                    width: 140,
                    child: Column(children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                            )
                            )),
                      ),
                      Container(child: Modified_text(text: trending[index]['title']!=null?
                     trending[index]['title']:'Loading' ),)
                    ]),
                  ):Container(),
                );
              }),
        )
      ]),
    );
  }
}
