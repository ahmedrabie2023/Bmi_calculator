import 'package:flutter/material.dart';

class ResultBmi extends StatelessWidget {
  String? status;
  double ?finalValue;
  var color;
  ResultBmi({super.key, required this.status,required this.finalValue,required this.color});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0E21),
        body: Column(
          children: [
             SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Your Result:",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset("images/BackIcon.png")),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.67,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF1A1F38)),
              child:   Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     SizedBox(height:  MediaQuery.of(context).size.height*0.04),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        status!,
                        style:   TextStyle(fontSize: 40, color:color,fontWeight: FontWeight.bold),
                      ),
                    ),
                     SizedBox(
                      height: MediaQuery.of(context).size.height*0.12,
                    ),
                    Text(
                      "$finalValue",
                      style: const TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
