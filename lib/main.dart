import 'package:flutter/material.dart';
import 'package:movies_info/utis/text.dart';
import 'package:movies_info/widget/toprated.dart';
import 'package:movies_info/widget/trending.dart';
import 'package:movies_info/widget/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(key: null,),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:Colors.green,
        brightness: Brightness.dark,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({@required super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '287037faa96138038d6e52602f838498';
  final readaccesstoken= 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyODcwMzdmYWE5NjEzODAzOGQ2ZTUyNjAyZjgzODQ5OCIsInN1YiI6IjY0Yjk0MDk4NGQyM2RkMDBjODEzZmFmZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QIHGzqaGW4eo7FKn9OlBmlQzyIWfQkDTfh3J3u5QFkM';

  @override
  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies()async{
    TMDB tmdbwithCustomLogs =TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ));

    Map? trendingresult = await tmdbwithCustomLogs.v3.trending.getTrending();
    Map? topratedresult = await tmdbwithCustomLogs.v3.movies.getTopRated();
    Map? tvresult = await tmdbwithCustomLogs.v3.tv.getPopular();
    print(trendingresult);
    setState(() {
      trendingmovies = trendingresult['results']??[];
      topratedmovies = topratedresult['results']??[];
      tv = tvresult['results']??[];
    });
    print(trendingmovies);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Modified_text(text : 'Flutter Movie App❤️'),
      ),
      body: ListView(
        children:[
          TV(tv: tv),
          TopRated(toprated: topratedmovies),
            TrendingMovies(trending:trendingmovies)
        ],
        
      ),
    );
  }
}