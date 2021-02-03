import 'package:flutter/material.dart';

class SliverAppBarScreen extends StatefulWidget {
  @override
  _SliverAppBarScreenState createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            //title: Text('Slivers'),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
                color: Colors.white),
            actions: [
              IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                  color: Colors.white),
            ],
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Slivers with Flutter'),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://raw.githubusercontent.com/flutter/assets-for-api-docs/master/assets/widgets/owl.jpg',
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black26, Colors.black54],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, index) {
              return ListTile(
                title: Text('item $index'),
              );
            }),
          ),
        ],
      ),
    );
  }
}
