import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsproject/model/Category.dart';
import 'package:newsproject/helper/Categorylist.dart';
import 'package:newsproject/model/newsmodel.dart';
import 'package:newsproject/helper/new_helper.dart';
import 'package:newsproject/screens/webview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsproject/screens/categorynews.dart';
import 'package:async/async.dart';
import 'package:newsproject/screens/pageview.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> CategoryList = List<Category>();
  List<NewsModel> newsList = List<NewsModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryList = getCategoryList();
    getnews();
  }

  getnews() async {
    NewsHelper newsHelper = NewsHelper();
    await newsHelper.getNews();
    newsList = newsHelper.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        //backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News"),
            Text(
              "Store",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
          :Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            /// Categories
            Container(
              height: 90,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: CategoryList.length,
                  itemBuilder: (context, index) {
                    return CategoryPlate(
                      imageurl: CategoryList[index].C_imageUrl,
                      title: CategoryList[index].C_title,
                    );
                  }),
            ),

            /// News Article List
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: newsList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogPlate(
                        title: newsList[index].title,
                        imageUrl: newsList[index].urlToImage,
                        description: newsList[index].description,
                        url: newsList[index].url,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
//        body: SingleChildScrollView(
//          child: Container(
//              padding: EdgeInsets.symmetric(horizontal: 15),
//            child: Column(
//              children: <Widget>[
//                Container(
//                  height: 90,
//                  child: ListView.builder(
//                      shrinkWrap: true,
//                      scrollDirection: Axis.horizontal,
//                      itemCount: CategoryList.length,
//                      itemBuilder: (context, index) {
//                        return CategoryPlate(
//                          imageurl: CategoryList[index].C_imageUrl,
//                          title: CategoryList[index].C_title,
//                        );
//                      }),
//                ),
//                //categorys
//                Container(
//                  child: ListView.builder(
//                      shrinkWrap: true,
//                      physics: AlwaysScrollableScrollPhysics(),
//                      itemCount: newsList.length,
//                      itemBuilder: (context, index) {
//                        return BlogPlate(
//                          title: newsList[index].title,
//                          imageUrl: newsList[index].urlToImage,
//                          description: newsList[index].description,
//                        );
//                      }),
//                )
//              ],
//            ),
//          ),
//        )
//
    );
  }
}

class CategoryPlate extends StatelessWidget {
  final String imageurl, title;

  CategoryPlate({this.imageurl, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Pageview(this.title.toLowerCase())
        ));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.only(right: 5, left: 5, top: 10),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imageurl,
                  width: 130,
                  height: 90,
                  fit: BoxFit.cover,
                )),
            Container(
              width: 120,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogPlate extends StatelessWidget {
  final String title, imageUrl, description, url;

  BlogPlate({this.title, this.imageUrl, this.description, this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.black38,
      elevation: 10,
      child: InkWell(
        splashColor: Colors.lightGreen,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Webview(
              url: this.url,
            )
          ));
        },
        child: Container(
          height: 300,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ))),
              Expanded(
                  flex: 2,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )),
//              Expanded(
//                flex: 1,
//                child: Text(description,style: TextStyle(color: Colors.black),),
//              )
            ],
          ),
        ),
      ),
    );
  }
}
