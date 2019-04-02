import 'package:video_game_message_board_app/model/topic.dart';

class Forum {
  final String title;
  final String imagePath;
  final String rank;
  final List<Topic> topics;
  final String threads;
  final String subs;

  Forum({this.title, this.imagePath, this.rank, this.threads, this.subs, this.topics});
}

final fortniteForum = Forum(
    title: "Fortnite",
    imagePath: "assets/images/fortnite.jpg",
    rank: "31",
    threads: "88",
    subs: "500+",
    topics: fortniteTopics);

final pubgForum = Forum(
    title: "PUBG",
    imagePath: "assets/images/pubg.png",
    rank: "25",
    threads: "120",
    subs: "1000+",
    topics: pubgTopics);

final forums = [
  fortniteForum,
  pubgForum
];
