import 'package:flutter/material.dart';
import 'package:food_delivery/domain/model.dart';
import 'package:food_delivery/presentation/Widgets/appbar_widget.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail(this.food, {Key? key}) : super(key: key);
  final FoodModel food;
  @override
  State<FoodDetail> createState() => _FoodDetailState(food);
}

class _FoodDetailState extends State<FoodDetail> {
  final FoodModel food;

  _FoodDetailState(this.food);
  @override
  Widget build(BuildContext contextt) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBarWidget(
                  Icons.arrow_back_ios_new_rounded,
                  Icons.favorite_rounded,
                  () => Navigator.of(context).pop(),
                  _rightCallback),
              _foodDetailImage(),
              _foodDetailScreen()
            ],
          ),
        ));
  }

  _rightCallback() {}

  Widget _foodDetailImage() {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Column(
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0, -4))
                        ],
                        color: Color.fromARGB(255, 240, 240, 240),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                  ))
            ],
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    color: Colors.black, blurRadius: 10, offset: Offset(-5, 7))
              ], borderRadius: BorderRadius.circular(100), color: Colors.grey),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  food.image,
                  height: 180,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _foodDetailScreen() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 240, 240, 240),
      child: Column(
        children: [
          Text(
            food.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.timelapse_rounded,
                    color: Colors.blue,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    food.waitTime + " Min",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline_rounded,
                    color: Colors.amber,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    food.score.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.local_fire_department_rounded,
                    color: Colors.red,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    food.calories + " Cal",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 60,
            width: double.maxFinite,
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(-0.4, 0),
                  child: Container(
                    width: 160,
                    height: double.maxFinite,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 211, 211, 211),
                              blurRadius: 10,
                              offset: Offset(-5, 7))
                        ],
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 231, 231, 231)),
                    child: Text(
                      food.price.toString() + "\$",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.4, 0),
                  child: Container(
                      width: 150,
                      height: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 211, 211, 211),
                                blurRadius: 10,
                                offset: Offset(-5, 7))
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.amber),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            " - ",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Text(
                              food.quantity.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Text(
                            " + ",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "About",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  food.about,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
