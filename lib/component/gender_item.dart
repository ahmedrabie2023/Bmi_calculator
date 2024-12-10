import 'package:flutter/material.dart';
class GenderItem extends StatelessWidget {
  var imageOfGender;
  String typeOfGender;
  bool selected;
  GenderItem(this.imageOfGender, this.typeOfGender, this.selected, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      height: MediaQuery.of(context).size.height * 0.19,
      decoration: BoxDecoration(
        border: Border.all(
            color: selected ? Colors.blue : Colors.transparent, width: 4),
        color: const Color(0xFF1A1F38),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imageOfGender),
          Text(
            typeOfGender,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
