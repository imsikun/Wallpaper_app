import 'dart:convert';

import 'package:Wallpaper_app/data/data.dart';
import 'package:Wallpaper_app/model/wallpapermodel.dart';
import 'package:Wallpaper_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categories extends StatefulWidget {
  final String categoriesName;

  Categories({this.categoriesName});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<WallpaperModel> wallpapers = new List();

  getSearchedWallpaper(String query) async {
    var res = await http.get(
        "https://api.pexels.com/v1/search?query=$query&per_page=15",
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
    getSearchedWallpaper(widget.categoriesName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
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
