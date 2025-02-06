import 'package:flutter/material.dart';
import 'package:flutter_application_2/service/episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class urlButton extends StatelessWidget {
  final EpisodeModel episode;
  final String title;

  const urlButton({
    super.key,
    required this.episode,
    required this.title,
  });

  onButton() async {
    print(title);
    await launchUrlString(
      'https://comic.naver.com/webtoon/detail?titleId=$title&no=${episode.id}&week=thu',
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButton,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.brown),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  episode.title,
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
