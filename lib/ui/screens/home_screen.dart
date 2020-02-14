import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_unsplash/models/sample_image.dart';
import 'package:flutter_unsplash/networking/network_helper.dart';
import 'package:flutter_unsplash/ui/screens/about_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  NetworkHelper helper = NetworkHelper();
  Future<List<SampleImage>> _list;

  List<Widget> getImagesToScreen(List list) {
    List<Widget> cardList = [];
    for (SampleImage sImage in list) {
      cardList.add(GestureDetector(
        onTap: () {
          Navigator.of(context).push(PageTransition(type: PageTransitionType.fadeIn, child: AboutScreen(sImage.regularImage)));
        },
        child: Card(
          elevation: 6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    sImage.thumbImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Text(
                        sImage.description ?? 'Untitled',
                        maxLines: 2,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    // SizedBox(height: 30),
                    Container(
                      width: 150,
                      child: Text(
                        sImage.user.name ?? 'Unassigned author',
                        maxLines: 2,
                        style: TextStyle(fontSize: 14, color: Colors.grey,
                        fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    }
    return cardList;
  }

  @override
  void initState() {
    super.initState();
    _list = helper.getImagesList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SampleImage>>(
      future: _list,
      builder:
          (BuildContext context, AsyncSnapshot<List<SampleImage>> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(widget.title),
            ),
            body: SafeArea(
              child: ListView(
                children: getImagesToScreen(snapshot.data),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


