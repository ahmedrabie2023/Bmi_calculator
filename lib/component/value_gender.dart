import 'package:flutter/material.dart';
class ValueGender extends StatelessWidget {
  String valueOfGender;
  var imageMinus;
  var imagePlus;
  int counter = 0;
  var funMinus;
  var funPlus;
  ValueGender(this.valueOfGender, this.imageMinus, this.imagePlus, this.counter,
      this.funMinus, this.funPlus,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      height: MediaQuery.of(context).size.height * 0.27,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F38),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            valueOfGender,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          Text(
            counter.toString(),
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: funMinus,
                child: Image.asset(imageMinus),
              ),
              InkWell(
                onTap: funPlus,
                child: Image.asset(imagePlus),
              ),
            ],
          )
        ],
      ),
    );
  }
}
