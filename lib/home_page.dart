import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'YouTube',
          style: TextStyle(
            color: Colors.red,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: ids.isEmpty
          ? const Center(child: Text("No videos now"))
          : ListView.builder(
              itemCount: ids.length,
              itemBuilder: (context, index) {
                return   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:   Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // عرض الفيديو مباشرة في القائمة
                        YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: ids[index]['id'].toString(),
                            flags: const YoutubePlayerFlags(
                              autoPlay: false,
                              mute: false,
                            ),
                          ),
                        ),
                        Text(
                          ids[index]['title'],
                          style:const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
