import 'package:Wallpaper_app/model/categories_model.dart';

String apiKey = '563492ad6f91700001000001d79ecbad039f4a749be70a64aeb73525';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = new List();
  CategoriesModel categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/162379/lost-places-pforphoto-leave-factory-162379.jpeg?auto=compress&cs=tinysrgb&h=650&w=940';
  categoriesModel.categoresName = 'Street Art';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/16066/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=650&w=940';
  categoriesModel.categoresName = 'Wild Life';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/70365/forest-sunbeams-trees-sunlight-70365.jpeg?auto=compress&cs=tinysrgb&h=650&w=940';
  categoriesModel.categoresName = 'Nature';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/1034662/pexels-photo-1034662.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260';
  categoriesModel.categoresName = 'City';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/2045600/pexels-photo-2045600.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260';
  categoriesModel.categoresName = 'Motivation';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/296735/pexels-photo-296735.jpeg?auto=compress&cs=tinysrgb&h=650&w=940';
  categoriesModel.categoresName = 'Bikes';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      'https://images.pexels.com/photos/1149831/pexels-photo-1149831.jpeg?auto=compress&cs=tinysrgb&h=650&w=940';
  categoriesModel.categoresName = 'Cars';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return categories;
}
