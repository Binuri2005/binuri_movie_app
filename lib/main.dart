import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

// import 'package:binuri_movie_app/widgets/trending.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binuri Movie App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadmovies();
  }

  List trendingMovies = [];
  loadmovies() async {
    TMDB tmdb = TMDB(
      ApiKeys('141f38a539f2a74dc1a5c12f06bad626',
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNDFmMzhhNTM5ZjJhNzRkYzFhNWMxMmYwNmJhZDYyNiIsInN1YiI6IjY1YjVmYzBkYWZlMjI0MDE4NDM5ZjhiMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.26H0aMzwIfOMibPgk8ecgLBCgHyrff1UFWBECuAAsUU'),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingResult = await tmdb.v3.trending.getTrending();
    print(trendingResult);
    setState(() {
      trendingMovies = trendingResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Movie app binuri'),
          backgroundColor: Colors.red,
        ),
        body: const Trending(
          trendingList: [
            "Mahesh",
            "jdjf",
            "sjfhjdf",
            "bfjdbfj",
            "jdbfjdb",
            "sfgdhbfhjdb"
          ],
        ));
  }
}

class Trending extends StatelessWidget {
  final List? trendingList;

  const Trending({super.key, this.trendingList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: trendingList?.length,
      itemBuilder: (BuildContext context, int index) {
        return
            ListTile(
              title: InkWell(
                onTap: () {
                  print('Ink well pressed');
                },
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        'http://image.tmdb.org/t/p/w500/iiid1xMhoAcW83VJ9LdAqf4Vtbr.jpg'),
                  )),
                  height: 200,
                ),
              ),
            );

      },
    );
  }
}
