import 'package:flutter/material.dart';
import 'package:flutter_application_2/service/api_service.dart';
import 'package:flutter_application_2/service/webToon_Model.dart';
import 'package:flutter_application_2/widget/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebToonModel>> webToon = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blueAccent,
          backgroundColor: Colors.brown,
          title: Text(
            "Hello, COMICS!",
            style: TextStyle(fontSize: 35),
          ),
        ),
        body: (FutureBuilder(
          future: webToon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: makeList(snapshot),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )));
  }

  ListView makeList(AsyncSnapshot<List<WebToonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 40,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          thumb: webtoon.thumb,
          title: webtoon.title,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }
}
