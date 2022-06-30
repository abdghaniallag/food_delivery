import 'package:flutter/material.dart';
import 'package:food_delivery/domain/model.dart';
import 'package:food_delivery/presentation/resources/assets_manager.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget(this.restaurantModel, {Key? key}) : super(key: key);
  final RestaurantModel restaurantModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(right: 20, left: 20),
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurantModel.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(restaurantModel.waitTime,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white)),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          restaurantModel.distace,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 10),
                        Text(restaurantModel.label,
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width: 250,
                  child: Text(
                    restaurantModel.description,
                    maxLines: 3,
                  )),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.restaurantLogo,
                  fit: BoxFit.fitWidth,
                  width: 85,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                    ),
                    Text(restaurantModel.score.toString()),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
