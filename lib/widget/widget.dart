import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywallpaper/model/wall_model.dart';
import 'package:mywallpaper/view/image_view.dart';
Widget BrandName(){
  return Container(
    alignment: Alignment.center,
    child: RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 16),
        children: <TextSpan>[
          TextSpan(text: 'Awesome', style: TextStyle(color: Colors.black87)),
          TextSpan(text: 'Wallpaper',style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
  );
}
Widget wallpaperList( {List<WallpaperModel>wallpaperMo,context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child:GridView.count(crossAxisCount: 2,
    shrinkWrap:true,
    physics: ClampingScrollPhysics(),
    childAspectRatio: 0.6,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: wallpaperMo.map((wallpaperMo){
        return GridTile(
          child: Container(
            
            child:GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> ImageView(
                  imageUrl: wallpaperMo.src.portrait,
                )));
              },
              child: Hero(
                tag: wallpaperMo.src.portrait,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(wallpaperMo.src.portrait,fit: BoxFit.cover,)),
              ),
            ),
          ),
        );
      }).toList(),
    )
  );
}