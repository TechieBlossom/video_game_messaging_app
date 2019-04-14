import 'package:cloud_firestore/cloud_firestore.dart';

class Topic {
  final String question;
  final String recentAnswer;
  final String answerCount;

  Topic({this.question, this.recentAnswer, this.answerCount});

  Topic.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);

  Topic.fromMap(Map<dynamic, dynamic> map)
      : assert(map["question"] != null),
        assert(map["answerCount"] != null),
        assert(map["recentAnswer"] != null),
        question = map["question"],
        answerCount = map["answerCount"],
        recentAnswer = map["recentAnswer"];
}

final fortniteTopics = [
  Topic(
    question: "Should we drop early?",
    recentAnswer:
        "I hear this question often, so I figured I'd start a thread. When I drop early it usually",
    answerCount: "1241",
  ),
  Topic(
    question: "Quitting FN because of this",
    recentAnswer:
    "Literally done with game until they balance the map better so that the blue corner",
    answerCount: "238",
  ),
];

final pubgTopics = fortniteTopics;
