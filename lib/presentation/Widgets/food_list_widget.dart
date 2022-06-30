import 'package:flutter/material.dart';
import 'package:food_delivery/domain/model.dart';
import 'package:food_delivery/presentation/Widgets/food_item.dart';

class FoodList extends StatelessWidget {
  const FoodList(
    this.restaurant,
    this.callBack,
    this.selectedItem,
    this.pageController, {
    Key? key,
  }) : super(key: key);
  final RestaurantModel restaurant;
  final Function callBack;
  final int selectedItem;
  final PageController pageController;
  //List<FoodModel> listOfFood ;
  @override
  Widget build(BuildContext context) {
    final List<String> menu = restaurant.menu.keys.toList();
    return Container(
      padding: const EdgeInsets.all(15),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callBack(index),
        children: menu.map((e) {
          if (restaurant.menu[menu[selectedItem]]!.isEmpty) {
            return const Center(child: Text("no data"));
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: restaurant.menu[menu[selectedItem]]!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: FoodItem(restaurant.menu[menu[selectedItem]]![index]),
                );
              },
            );
          }
        }).toList(),
      ),
    );
  }
}

class RestaurantMenu extends StatelessWidget {
  final RestaurantModel restaurant;
  final Function callBack;
  final int selectedItem;
  const RestaurantMenu(this.selectedItem, this.callBack, this.restaurant,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menu = restaurant.menu.keys.toList();
    return SizedBox(
      height: 80,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => callBack(index),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 0.7,
                            blurStyle: BlurStyle.outer,
                            color: Colors.grey,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: selectedItem == index
                            ? Colors.yellow
                            : Colors.white),
                    child: Text(
                      menu[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
          separatorBuilder: (_, index) => const SizedBox(
                width: 20,
              ),
          itemCount: menu.length),
    );
  }
}
