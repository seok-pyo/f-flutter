import 'package:flutter/material.dart';
import 'package:flutter_application_2/service/api_service.dart';
import 'package:flutter_application_2/service/detail_model.dart';
import 'package:flutter_application_2/service/episode_model.dart';
import 'package:flutter_application_2/widget/episode_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:flutter_application_2/service/api_service.dart';
// import 'package:flutter_application_2/service/detail_model.dart';

class Detailscreen extends StatefulWidget {
  final String thumb, title, id;

  const Detailscreen({
    super.key,
    required this.thumb,
    required this.title,
    required this.id,
  });

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  late Future<DetailModel> webtoon;
  late Future<List<EpisodeModel>> episode;
  late SharedPreferencesAsync pref;
  bool isLiked = false;

  Future initPref() async {
    pref = SharedPreferencesAsync();
    final likedToons = await pref.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await pref.setStringList('likedToons', []);
    }
  }

  onHeartTap() async {
    final likedToons = await pref.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await pref.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getDetail(widget.id);
    episode = ApiService.getEpisode(widget.id);
    initPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.import_contacts_outlined),
        ),
        foregroundColor: Colors.blueAccent,
        backgroundColor: Colors.brown,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 35),
        ),
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 25,
            ),
          ),
          SliverToBoxAdapter(
            child: Hero(
              tag: widget.id,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  width: 250,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          offset: Offset(15, 15),
                          blurRadius: 10)
                    ],
                  ),
                  child: Image.network(
                    widget.thumb,
                    headers: const {
                      'Referer': 'https://comic.naver.com',
                    },
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: webtoon,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                              style: TextStyle(fontSize: 13),
                              '${snapshot.data!.genre} / ${snapshot.data!.age}'),
                        ],
                      )),
                );
              } else {
                return SliverToBoxAdapter(child: Center(child: Text('...')));
              }
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 25,
            ),
          ),
          FutureBuilder(
            future: episode,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var episode = snapshot.data![index];
                      print(episode.title);
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        child: urlButton(episode: episode, title: widget.id),
                      );
                    },
                    childCount: snapshot.data!.length,
                  ),
                );
              }
              return SliverToBoxAdapter(
                child: Container(),
              );
            },
          ),
        ],
      ),
    );
  }
}
