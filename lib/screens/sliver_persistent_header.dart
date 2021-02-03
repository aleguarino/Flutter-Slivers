import 'package:flutter/material.dart';

class SliverPersistentHeaderScreen extends StatefulWidget {
  @override
  _SliverPersistentHeaderScreenState createState() =>
      _SliverPersistentHeaderScreenState();
}

class _SliverPersistentHeaderScreenState
    extends State<SliverPersistentHeaderScreen> {
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: MyPersistentHeaderDelegate(
              username: 'Alex aaaaaaa',
              statusBarHeight: statusBarHeight,
              maxHeight: 300,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, index) {
              return ListTile(
                title: Text('index $index'),
              );
            }, childCount: 100),
          ),
        ],
      ),
    );
  }
}

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  static const double APPBAR_SIZE = 60;
  final String username;
  final double maxHeight;
  final double statusBarHeight;
  double minHeight;

  MyPersistentHeaderDelegate({
    @required this.username,
    @required this.maxHeight,
    @required this.statusBarHeight,
  }) {
    minHeight = APPBAR_SIZE + statusBarHeight;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double headerHeight = maxHeight - shrinkOffset;
    if (headerHeight < minExtent) {
      headerHeight = minExtent;
    }
    final tmp1 = headerHeight - minExtent;
    final tmp2 = maxExtent - minExtent;
    double delta = tmp1 / tmp2;

    double avatarSize = delta * 60 * 2;
    if (avatarSize < APPBAR_SIZE) {
      avatarSize = APPBAR_SIZE;
    }

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double avatarOffsetX =
        (delta - 1) * (deviceWidth / 2 - avatarSize / 2);

    return SizedBox.expand(
      child: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        color: Colors.blue,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: Offset(avatarOffsetX, 0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: avatarSize / 2,
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              child: Transform.scale(
                scale: delta,
                child: Opacity(
                  opacity: delta,
                  child: Text(
                    username,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => this.maxHeight;

  @override
  double get minExtent => this.minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
