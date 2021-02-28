import 'dart:convert';
import 'package:mywallpaper/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mywallpaper/data/data.dart';
import 'package:mywallpaper/model/wall_model.dart';
class Categories extends StatefulWidget {
  final String CategoriesName;
  Categories({this.CategoriesName});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<WallpaperModel>wallpaperMo= new List();

  getSearchWallpaper(String query) async{
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=50",
        headers: {"Authorization":apiKey});
    // print(response.body.toString());
    Map<String,dynamic>jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      //print(element);
      WallpaperModel wallpaper= new WallpaperModel();
      wallpaper = WallpaperModel.fromMap(element);
      wallpaperMo.add(wallpaper);
    });
    setState(() {});
  }
  @override
  void initState() {
   getSearchWallpaper(widget.CategoriesName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: BrandName(),
    backgroundColor:Colors.white,
    elevation: 0.0,
    ),
        body:SingleChildScrollView(
    child: Container(
    child:Column(
    children: [
    SizedBox(height: 16,),
    wallpaperList(wallpaperMo:wallpaperMo,context: context )
    ],
    ),
    ),
    )
    );
  }
}
