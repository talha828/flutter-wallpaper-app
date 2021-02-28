import 'package:mywallpaper/model/models.dart';
  String apiKey="563492ad6f91700001000001bedefffcf75f4e3cace06ef8cc5b539a";
List<CategoriesModel> getCategories() {
  List<CategoriesModel> Categories= new List();
  CategoriesModel CategorieModel = new CategoriesModel();

  CategorieModel.imgUrl ="https://images.pexels.com/photos/2119706/pexels-photo-2119706.jpeg?cs=srgb&dl=pexels-tobias-bj%C3%B8rkli-2119706.jpg&fm=jpg";
  CategorieModel.item ="Street Art";
  Categories.add(CategorieModel);
  CategorieModel =new CategoriesModel();

  CategorieModel.imgUrl="https://images.pexels.com/photos/623919/pexels-photo-623919.jpeg?cs=srgb&dl=pexels-flo-maderebner-623919.jpg&fm=jpg";
  CategorieModel.item ="Bikes";
  Categories.add(CategorieModel);
  CategorieModel =new CategoriesModel();

  CategorieModel.imgUrl="https://images.pexels.com/photos/1257860/pexels-photo-1257860.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  CategorieModel.item ="Stars";
  Categories.add(CategorieModel);
  CategorieModel =new CategoriesModel();

  CategorieModel.imgUrl="https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg?cs=srgb&dl=pexels-michael-block-3225517.jpg&fm=jpg";
  CategorieModel.item ="Nature";
  Categories.add(CategorieModel);
  CategorieModel =new CategoriesModel();
  String apiKey = "563492ad6f91700001000001bedefffcf75f4e3cace06ef8cc5b539a";

  CategorieModel.imgUrl="https://images.pexels.com/photos/816608/pexels-photo-816608.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  CategorieModel.item ="Universe";
  Categories.add(CategorieModel);
  CategorieModel =new CategoriesModel();

  CategorieModel.imgUrl="https://images.pexels.com/photos/220201/pexels-photo-220201.jpeg?cs=srgb&dl=pexels-pixabay-220201.jpg&fm=jpg";
  CategorieModel.item ="Earth";
  Categories.add(CategorieModel);
  CategorieModel =new CategoriesModel();

  CategorieModel.imgUrl="https://images.pexels.com/photos/1210273/pexels-photo-1210273.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  CategorieModel.item ="Sunset";
  Categories.add(CategorieModel);
  CategorieModel =new CategoriesModel();

return Categories;
}