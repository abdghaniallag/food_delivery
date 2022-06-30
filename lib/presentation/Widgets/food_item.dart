import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/domain/model.dart';

import '../food/food_detail.dart';

class FoodItem extends StatelessWidget {
  FoodModel foodItem;
  FoodItem(this.foodItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("message");
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FoodDetail(foodItem)));
      },
      child: Container(
        height: 110,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [_getFoodIcon(), _getFoodDetail()],
        ),
      ),
    );
  }

  Widget _getFoodIcon() {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.grey),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          foodItem.image,
          height: 80,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _getFoodDetail() {
    return Expanded(
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 16, left: 16, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(foodItem.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const Icon(Icons.arrow_forward_rounded)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, right: 50),
                child: Text(
                  foodItem.description,
                  style: TextStyle(
                      fontSize: 12,
                      color: (foodItem.highLight ? Colors.amber : Colors.grey)),
                ),
              ),
              Text(foodItem.price.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
