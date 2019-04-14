import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_game_message_board_app/api/firebase_service.dart';
import 'package:video_game_message_board_app/common/forum_card.dart';
import 'package:video_game_message_board_app/common/tab_text.dart';
import 'package:video_game_message_board_app/model/forum.dart';

class HorizontalTabLayout extends StatefulWidget {
  final FirebaseService firebaseService;

  HorizontalTabLayout({this.firebaseService});

  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout>
    with SingleTickerProviderStateMixin {
  int selectedTabIndex = 2;
  AnimationController _controller;
  Animation<Offset> _animation;
  Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.05, 0)).animate(
            _controller);
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -30,
            bottom: 0,
            top: 0,
            width: 110.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80.0,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TabText(
                    text: "Media",
                    isSelected: selectedTabIndex == 0,
                    onTabTap: () {
                      onTabTap(0);
                    },
                  ),
                  TabText(
                    text: "Streamers",
                    isSelected: selectedTabIndex == 1,
                    onTabTap: () {
                      onTabTap(1);
                    },
                  ),
                  TabText(
                    text: "Forum",
                    isSelected: selectedTabIndex == 2,
                    onTabTap: () {
                      onTabTap(2);
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 65.0),
            child: FutureBuilder(
              future: playAnimation(),
              builder: (context, snapshot) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _animation,
                    child: StreamBuilder(
                      stream: widget.firebaseService.getList(getTypeByIndex(selectedTabIndex)),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                        if (asyncSnapshot.hasError) {
                          return Center(child: Text("Error..."));
                        }

                        switch (asyncSnapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(child: CircularProgressIndicator());
                          default:
                            return _buildList(context, asyncSnapshot.data.documents);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  String getTypeByIndex(int index) {
    switch (index) {
      case 0: return "Media";
      case 1: return "Streamers";
      case 2: return "Forum";
      default: return "Forum";
    }
  }

  Widget _buildList(context, List<DocumentSnapshot> snapshots) {
    return ListView.builder(
        itemCount: snapshots.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index) {
          return ForumCard(
            forum: Forum.fromSnapshot(snapshots[index]),
          );
        });
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
