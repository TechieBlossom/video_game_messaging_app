import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_game_message_board_app/model/topic.dart';

class Forum {
  final String title;
  final String imagePath;
  final String rank;
  final List<Topic> topics;
  final String threads;
  final String subs;

  Forum(
      {this.title,
      this.imagePath,
      this.rank,
      this.threads,
      this.subs,
      this.topics});

  Forum.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);

  Forum.fromMap(Map<String, dynamic> map)
      : assert(map["title"] != null),
        assert(map["imagePath"] != null),
        assert(map["rank"] != null),
        assert(map["subs"] != null),
        assert(map["threads"] != null),
        assert(map["topics"] != null),
        title = map["title"],
        imagePath = map["imagePath"],
        rank = map["rank"],
        subs = map["subs"],
        threads = map["threads"],
        topics = ((map["topics"]) as List).map((topic) => Topic.fromMap(topic)).toList();
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

final forums = [fortniteForum, pubgForum];
