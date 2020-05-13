import 'package:flutter/material.dart';
import 'package:newsproject/helper/new_helper.dart';
import 'package:newsproject/model/newsmodel.dart';
import 'package:newsproject/screens/webview.dart';
class CategoryType extends StatefulWidget {
  final String category;
   CategoryType(this.category);
  @override
  _CategoryTypeState createState() => _CategoryTypeState();
}

class _CategoryTypeState extends State<CategoryType> {
  List<NewsModel> newsList = List<NewsModel>();
  bool loading =true;

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

      body: loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
          :Container(
       // margin: EdgeInsets.only(top: 16),
        child: PageView.builder(
            itemCount: newsList.length,
            //shrinkWrap: true,
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
        splashColor: Colors.green,
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
              SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 2,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    description,
                    style: TextStyle(
                        color: Colors.grey[100],
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
