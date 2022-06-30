import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  Function? leftCallback, rightCallback;
  IconData leftIcon, rightIcon;

  AppBarWidget(
      this.leftIcon, this.rightIcon, this.leftCallback, this.rightCallback,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => leftCallback!(), child: _buildIconButton(leftIcon)),
          GestureDetector(
              onTap: () => rightCallback!(),
              child: _buildIconButton(rightIcon)),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Icon(icon),
    );
  }
}
