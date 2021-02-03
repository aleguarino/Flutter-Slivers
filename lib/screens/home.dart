import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black12,
        child: CustomScrollView(
          slivers: [
            SliverSafeArea(
              bottom: false,
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 100,
                    color: Colors.red,
                    margin: EdgeInsets.only(top: 10),
                  ),
                  Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 100,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            SliverSafeArea(
              top: false,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    return Container(
                      color: Colors.black38,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(15),
                      child: Text('sliverList 2: $index'),
                    );
                  },
                  childCount: 40,
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((_, index) {
                return Container(
                  color: Colors.purple,
                );
              }, childCount: 50),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 16 / 9,
                maxCrossAxisExtent: 50,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                margin: EdgeInsets.all(10),
                color: Colors.redAccent,
                child: Row(children: [
                  CupertinoButton(
                    child: Text('Button 1'),
                    onPressed: () {},
                  ),
                  CupertinoButton(
                    child: Text('Button 2'),
                    onPressed: () {},
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
