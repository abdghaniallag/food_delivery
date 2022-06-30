import 'package:food_delivery/presentation/resources/assets_manager.dart';

class FoodModel {
  String image;
  String description;
  String name;
  String waitTime;
  num score;
  String calories;
  num price;
  num quantity;
  String about;
  bool highLight;
  FoodModel(this.image, this.description, this.name, this.waitTime, this.score,
      this.calories, this.price, this.quantity, this.about,
      {this.highLight = false});
  static List<FoodModel> generatsRecommendedFood() {
    return [
      FoodModel(
          ImageAssets.poffertjesS,
          "10 Pièce, Sauce aux Choix, Supplément aux Choix",
          "Poffertjes S",
          "20",
          4.5,
          "300",
          300,
          10,
          "10 Pièce, Sauce aux Choix, Supplément aux Choix",
          highLight: true),
      FoodModel(
          ImageAssets.poffertjesM,
          "15 Pièce, Sauce aux Choix, Supplément aux Choix",
          "Poffertjes M",
          "20",
          4.6,
          "450",
          400,
          10,
          "15 Pièce, Sauce aux Choix, Supplément aux Choix"),
      FoodModel(
          ImageAssets.poffertjesL,
          "20 Pièce, Sauce aux Choix, Supplément aux Choix",
          "Poffertjes L",
          "20",
          4,
          "600",
          500,
          15,
          "20 Pièce, Sauce aux Choix, Supplément aux Choix"),
    ];
  }
}

class RestaurantModel {
  String name;
  String waitTime;
  String distace;
  String label;
  String logo;
  String description;
  num score;
  String mobile;
  Map<String, List<FoodModel>> menu;
  RestaurantModel(this.name, this.waitTime, this.distace, this.label, this.logo,
      this.description, this.score, this.mobile, this.menu);
  static RestaurantModel generatsRestaurent() {
    List<FoodModel> recommended = FoodModel.generatsRecommendedFood();
    recommended.sort((a, b) => a.score.compareTo(b.score));
    return RestaurantModel(
        "Poffertjes",
        "20-30",
        "2.5Km",
        "Havana - Bab Ezzouar",
        ImageAssets.restaurantLogo,
        "Le Havana est LE restaurant à thème à Alger. Idéal pour des Evénements privés ou d'entreprises , aussi pour des sorties romantiques ou en famille . L'équipe organise des soirées animées et dîners dansants chaque week-end",
        3.8,
        "0777777777", {
      "Recommded": recommended,
      "Popular": FoodModel.generatsRecommendedFood(),
      "Noodels": [],
      "Pizza": []
    });
  }
}
