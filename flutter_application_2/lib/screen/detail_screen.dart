import 'package:flutter/material.dart';
import 'package:flutter_application_2/service/api_service.dart';
import 'package:flutter_application_2/service/detail_model.dart';
import 'package:flutter_application_2/service/episode_model.dart';
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

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getDetail(widget.id);
    episode = ApiService.getEpisode(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.import_contacts_outlined)),
        foregroundColor: Colors.blueAccent,
        backgroundColor: Colors.brown,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Hero(
                tag: widget.id,
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
            FutureBuilder(
              future: webtoon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!.about,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  );
                } else {
                  return Text('...');
                }
              },
            ),
            SizedBox(
              height: 25,
            ),
            FutureBuilder(
              future: episode,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var episode = snapshot.data![index];
                        print(episode.title);
                        return Text(episode.title);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 15,
                          ),
                      itemCount: snapshot.data!.length);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
