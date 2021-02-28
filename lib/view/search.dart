import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mywallpaper/data/data.dart';
import 'package:mywallpaper/model/wall_model.dart';
import 'package:mywallpaper/widget/widget.dart';
import 'package:http/http.dart' as http;
class Search extends StatefulWidget {
  final String searchQuery;
  Search({this.searchQuery});
  @override
  _SearchState createState() => _SearchState();
}


class _SearchState extends State<Search> {
  List<WallpaperModel>wallpaperMo= new List();
  TextEditingController searchController = new TextEditingController();
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
    getSearchWallpaper(widget.searchQuery);
    super.initState();
    searchController.text =widget.searchQuery;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BrandName(),
        backgroundColor:Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child:Column(children:[
            SizedBox(height: 16,),
            wallpaperList(wallpaperMo:wallpaperMo,context: context ),
          ]
          ),
        ),
      ),
    );
  }
}

