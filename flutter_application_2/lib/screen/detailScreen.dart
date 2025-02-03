import 'package:flutter/material.dart';
import 'package:flutter_application_2/service/api_service.dart';
import 'package:flutter_application_2/service/detail_model.dart';

class Detailscreen extends StatelessWidget {
  final String thumb, title, id;

  const Detailscreen({
    super.key,
    required this.thumb,
    required this.title,
    required this.id,
  });

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
          title,
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: FutureBuilder<DetailModel>(
        future: ApiService.getDetail(id),
        builder: (context, snapshot) {
          String title = 'loading...', age = '', genre = '', about = '';

          if (snapshot.hasData) {
            final detail = snapshot.data!;
            title = detail.title;
            age = detail.age;
            genre = detail.genre;
            about = detail.about;
          }

          return Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Hero(
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
              ),
              SizedBox(height: 50),
              Text(title),
              SizedBox(height: 5),
              Text(genre),
              SizedBox(height: 10),
              Text(about),
              SizedBox(height: 50),
              Text(age),
            ],
          );
        },
      ),
    );
  }
}
