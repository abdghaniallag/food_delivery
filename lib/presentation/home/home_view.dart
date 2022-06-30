import 'package:flutter/material.dart';
import 'package:food_delivery/domain/model.dart';
import 'package:food_delivery/presentation/Widgets/appbar_widget.dart';
import 'package:food_delivery/presentation/Widgets/food_list_widget.dart';
import 'package:food_delivery/presentation/Widgets/restaurant_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RestaurantModel restaurantModel = RestaurantModel.generatsRestaurent();
  int selectedItem = 0;

  PageController pageConotroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        AppBarWidget(Icons.arrow_back_ios_new_rounded, Icons.search_rounded,
            () => null, () => null),
        RestaurantWidget(restaurantModel),
        RestaurantMenu(selectedItem, (int index) {
          setState(() {
            selectedItem = index;
          });
          pageConotroller.jumpToPage(index);
        }, restaurantModel),
        Expanded(
          child: FoodList(restaurantModel, (int index) {
            setState(() {
              selectedItem = index;
            });
          }, selectedItem, pageConotroller),
        ),
      ]),
    );
  }
}
