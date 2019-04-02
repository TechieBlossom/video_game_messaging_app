import 'package:flutter/material.dart';
import 'package:video_game_message_board_app/common/tab_text.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout> {
  int selectedTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -20,
            bottom: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
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
        ],
      ),
    );
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
