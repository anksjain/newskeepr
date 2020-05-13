import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsproject/helper/new_helper.dart';
import 'package:newsproject/model/newsmodel.dart';
import 'package:sticky_headers/sticky_headers.dart';

class Pageview extends StatefulWidget {
  final String category;

  Pageview(this.category);

  @override
  _PageviewState createState() => _PageviewState(this.category);
}

class _PageviewState extends State<Pageview>
    with SingleTickerProviderStateMixin {
  final String category;

  _PageviewState(this.category);

  List<NewsModel> newsList = List<NewsModel>();
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getnews();
  }

  getnews() async {
    CategoryHelper categoryHelper = CategoryHelper();
    await categoryHelper.getNews(widget.category);
    newsList = categoryHelper.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : PageView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return (Container(
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          pinned: true,
                          snap: true,
                          backgroundColor: Colors.black,
                          floating: true,
                          expandedHeight: 350,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Image.network(
                              newsList[index].urlToImage,
                              fit: BoxFit.fill,
                            ),
                            title: Text(
                              this.category.toUpperCase(),
                              style: TextStyle(color: Colors.white),
                              softWrap: false,
                            ),
                          ),
                        ),

                        SliverFillRemaining(
                          fillOverscroll: false,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(30),
                                child: Text(
                                  newsList[index].title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.deepPurple[100],
                                  padding: EdgeInsets.only(
                                      left: 30, right: 30, top: 20),
                                  child: Text(
                                    newsList[index].description,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
//                      SliverPersistentHeader(
//                        pinned: true,
//                        floating: false,
//                        delegate: CustomSliverPersistentHeader(imageurl:newsList[index].urlToImage),
//                      ),
//                      SliverToBoxAdapter(
//                          child:Container(
//                            color: Colors.red,
//                            child: Column(
//                              children: <Widget>[
//
//                                Text(newsList[index].description)
//                              ],
//                            ),
//                          )
//                      ),
//                     SliverList(
//                       delegate: SliverChildBuilderDelegate((context,item) => Container(color: Colors.black,) ),
//
//                     )
                      ],
                    ),
                  ));
                }));
  }
}

class CustomSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  final String imageurl;

  CustomSliverPersistentHeader({this.imageurl});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    overlapsContent = false;
    return Stack(
      children: <Widget>[
        //Image.network("src",width: MediaQuery.of(context).size.width,height: 400,fit: BoxFit.fill,),
        Image.asset(
          'assets/images/avi.jpeg',
          height: 400,
        ),
        Positioned(
          top: 400 - 50 - shrinkOffset,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 400;

  @override
  // TODO: implement minExtent
  double get minExtent => 200;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
//class Pageview extends StatelessWidget {
//  var cup=['gvgv','bhbj','hhnj'];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: DefaultTabController(
//          length: 2,
//          child: SafeArea(
//              child: Container(
//                child: CustomScrollView(
//                  slivers: <Widget>[
//                    SliverAppBar(
//                      pinned: true,
//                      floating: true,
//                      expandedHeight: 300,
//                      flexibleSpace: FlexibleSpaceBar(
//                        background: Image.asset(
//                          "assets/images/avi.jpeg", fit: BoxFit.cover,),
//                        title: Text("sliver app bar"),
//                      ),
//                    ),
//                    SliverPersistentHeader(
//                      pinned: true,
//                      delegate: CustomSliverPersistentHeader(child:Container(
//                        height: 200,
//                          child: TabBar(
//                            tabs: <Widget>[
//                              Tab(text: 'Home',),
//                              Tab(icon: Icon(Icons.title),),
//
//                            ],
//                          ),
//                      )),
//                    ),
//                    SliverFillRemaining(
//                      child: TabBarView(
//                        children: <Widget>[
//                          Container(color: Colors.deepPurple,),
//                          Container(color: Colors.green,),
//                        ],
//                      )
//                    )
//                  ],
//                ),
//              )
//          ),
//        )
//    );
//  }
//}
//class _tabbar extends StatefulWidget {
//  @override
//  __tabbarState createState() => __tabbarState();
//}
//
//class __tabbarState extends State<_tabbar>  with SingleTickerProviderStateMixin{
//  TabController _tabController;
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _tabController = new TabController(length: 2, vsync: this);
//  }
//  @override
//  Widget build(BuildContext context) {
//    return  Container(
//      color: Colors.purple,
//      height: 500,
//      child: TabBar(
//        labelColor: Colors.black,
//        indicatorColor: Colors.black,
//        controller: this._tabController,
//        tabs: <Widget>[
//          Tab(text: 'Home',),
//          Tab(icon: Icon(Icons.title),),
//          //Tab(child: Container(color: Colors.white,child: MaterialButton(child: Text("click"),),),)
//        ],
//      ),
//
//
//    );
//  }
//}

//Container(
//child: CustomScrollView(
//slivers: <Widget>[
//SliverAppBar(
//automaticallyImplyLeading: false,
//leading: Icon(Icons.description),
//backgroundColor: Colors.red,
//elevation: 10,
//actions: <Widget>[
//Container(
//// color: Colors.redAccent,
//child: MaterialButton(
//color: Colors.amber,
//child: Text("BUTTON"),
//),
//)
//],
//pinned: true,
//expandedHeight: 200,
//flexibleSpace: FlexibleSpaceBar(
//title: Text("flexible bar",style: TextStyle(color: Colors.amberAccent),),
//background: Image.asset("assets/images/avi.jpeg",fit: BoxFit.cover,)
//),
//),
//SliverFillRemaining(
//child:Column(
//children: <Widget>[
//Container(
//height: 40,
//color: Colors.blue,
//),
//Container(
//color: Colors.green,
//height: 45,
//),
//Container(
//height: 100,
//color: Colors.yellow,
//),
//],
//
//))
//],
//),
//
//),
//
