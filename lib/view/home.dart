import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywallpaper/data/data.dart';
import 'package:mywallpaper/model/models.dart';
import 'package:mywallpaper/model/wall_model.dart';
import 'package:mywallpaper/view/carogry.dart';
import 'package:mywallpaper/view/search.dart';
import 'package:mywallpaper/widget/widget.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> Categories= new List();
  List<WallpaperModel>wallpaperMo= new List();
  TextEditingController searchController = new TextEditingController();

  getBestWallpaper() async{
    var response = await http.get("https://api.pexels.com/v1/curated?per_page=20",
    headers: {"Authorization":apiKey});
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
    getBestWallpaper();
    Categories = getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
            appBar: AppBar(
              title: BrandName(),
              backgroundColor:Colors.black54,
              elevation: 0.0,
            ),
            body:
            SingleChildScrollView(
              child: Container(
                child:Column(
                  children: [
                    Container(   
                      decoration: BoxDecoration(
                        color: Color(0xfff5f8fd),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 24.0),
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children:[
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: 'Search Wallpapers ',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap:(){
                                 Navigator.push(context,MaterialPageRoute(builder: (context)=> Search(
                                   searchQuery: searchController.text,
                                 ),),);

    },
                              child:
                          Container(child:
                          Icon(Icons.search
                          ))),
                        ]
                      ),
                    ),

                    SizedBox(height: 16,),
                    Container(
                      height: 70.0,
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: ListView.builder(
                        scrollDirection:Axis.horizontal,
                          shrinkWrap:true,
                          itemCount: Categories.length,
                          itemBuilder: (context ,index){
                      return CategoriesTiles(
                        item:Categories[index].item,
                        imgUrl:Categories[index].imgUrl,
                      );
                      }),
                    ),
                    Container(
                      padding:EdgeInsets.fromLTRB(0,0,0,10),
                      alignment:Alignment.center,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children:[ Text('Just open image and take a Screen shot ',style:TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                        ),),
                          Text(' for back just top bottom to image',style:TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),),
                        ]
                      ),

                    ),
                    SizedBox(height: 6,),
                    wallpaperList(wallpaperMo:wallpaperMo,context: context ),

                  ],
                ),

              ),
            ),

    );
  }
}

class CategoriesTiles extends StatelessWidget {
  @override
  final String imgUrl, item;

  CategoriesTiles({@required this.item, @required this.imgUrl});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            Categories(
              CategoriesName: item.toLowerCase(),
            )));
      },

      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(38.0),
            child: Image.network(
              imgUrl, height: 50, width: 100, fit: BoxFit.cover,),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(38.0),
              color: Colors.white,
            ),

            alignment: Alignment.center,
            height: 50,
            width: 100,
            child: Text(item,
              style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16,
              ),
            ),
          )
        ],
        ),
      ),
    );
  }
}




