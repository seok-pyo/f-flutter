import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String thumb, title, id;

  const Webtoon({
    super.key,
    required this.thumb,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailscreen(
              thumb: thumb,
              title: title,
              id: id,
            ),
            fullscreenDialog: true,
          )),
      child: Column(
        children: [
          Hero(
            tag: id,
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
                thumb,
                headers: const {
                  'Referer': 'https://comic.naver.com',
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(title),
        ],
      ),
    );
  }
}
