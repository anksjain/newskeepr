
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class TempScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.deepPurple,
            pinned: true,
            //title: Text("siver app bar"),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
                title: Text("siver app bar"), background: Placeholder()),
          ),
//            SliverToBoxAdapter(
//              child: Container(
//                height: 50,
//                width: MediaQuery.of(context).size.width,
//                decoration: BoxDecoration(
//                  //borderRadius: BorderRadius.circular(30),
//                  color: Colors.green,
//                ),
//              ),
//            ),
          SliverPersistentHeader(
                        pinned: true,
                        floating: false,
                        delegate: CustomSliverPersistentHeader(expandingheight: 200,collapaseheight: 60),
                      ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                color: Colors.deepPurple,
                 height: MediaQuery.of(context).size.height,
                alignment: Alignment.topCenter,
                child: Text("shjnjsnc0"),
              ),
            )
        ],

      ),
    ));
  }
}
class CustomSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  final double expandingheight;
  final double collapaseheight;

  CustomSliverPersistentHeader({this.expandingheight,this.collapaseheight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: expandingheight,
      color: Colors.amberAccent,
      child:Text("jbjcbjd"),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandingheight;

  @override
  // TODO: implement minExtent
  double get minExtent => collapaseheight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return (expandingheight!=oldDelegate.maxExtent ||collapaseheight!=oldDelegate.minExtent);
  }
}

