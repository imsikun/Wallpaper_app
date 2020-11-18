import 'dart:convert';

import 'package:Wallpaper_app/data/data.dart';
import 'package:Wallpaper_app/model/categories_model.dart';
import 'package:Wallpaper_app/model/wallpapermodel.dart';
import 'package:Wallpaper_app/views/categories.dart';
import 'package:Wallpaper_app/views/img_view.dart';
import 'package:Wallpaper_app/views/search.dart';
import 'package:Wallpaper_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();

  // for serchbar to pass it on the named constructor
  //as the user search to get the control on the text field
  TextEditingController searchController = new TextEditingController();

//most curated photos function
  getTrandingWallpapers() async {
    var res = await http.get("https://api.pexels.com/v1/curated?per_page=40",
        headers: {'Authorization': apiKey});
    // print(res.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(res.body);
    jsonData['photos'].forEach((element) {
      //showing the element for demo
      // print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getTrandingWallpapers();
    // TODO: implement initState
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'search ',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Search(
                                searchQuery: searchController.text,
                              ),
                            ));
                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                height: 80.0,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoriesTile(
                        title: categories[index].categoresName,
                        imgUrl: categories[index].imgUrl,
                      );
                    }),
              ),
              SizedBox(
                height: 15.0,
              ),
              wallpaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrl, title;

  const CategoriesTile({Key key, @required this.imgUrl, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Categories(categoriesName: title.toLowerCase()),
            ))
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(
                8,
              ),
              child: Image.network(
                imgUrl,
                height: 60,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              height: 60,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
