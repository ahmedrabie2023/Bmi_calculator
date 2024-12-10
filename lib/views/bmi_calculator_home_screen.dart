
import 'package:bmi_calculator/views/result_bmi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../blocs/cubits/bmi_cubit.dart';
import '../component/gender_item.dart';
import '../component/value_gender.dart';

class BmiCalculatorHomeScreen extends StatelessWidget {
  const BmiCalculatorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<BmiCubit, BmiState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = BmiCubit.get(context);
          return Scaffold(
              backgroundColor: const Color(0xFF0A0E21),
              appBar: AppBar(
                backgroundColor: const Color(0xFF1A1F38),
                shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                title: const Text(
                  "BMI calculator",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     SizedBox(
                      height: MediaQuery.of(context).size.height*0.003,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                            cubit.changeFemale();
                            },
                            child: GenderItem("images/Vector.png", "FEMALE",cubit.bmiModel.isFemale)),
                        GestureDetector(
                            onTap: () {
                            cubit.changeMale();
                            },
                            child: GenderItem("images/mars.png", "MALE",cubit.bmiModel.isMale)),
                      ],
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF1A1F38),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "HEIGHT ${cubit.bmiModel.height.round().toString()}",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Slider(
                              onChanged: cubit.changeSliderHeight,
                              min: 20,
                              max: 250,
                              value: cubit.bmiModel.height.toDouble(),
                              divisions: 200,
                              label: cubit.bmiModel.height.round().toString(),
                              activeColor: const Color(0xFF6200EE),
                              inactiveColor: const Color(0xFF979797),
                              thumbColor: const Color(0xFFF10606),
                            ),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ValueGender("WEIGHT", "images/minus iconwieght.png",
                            "images/plus icon weight.png", cubit.bmiModel.weight, (){
                              cubit.minusWeightBody();
                            },(){
                              cubit.addWeightBody();
                            } ),
                        ValueGender("AGE", "images/minus iconwieght.png",
                            "images/plus icon weight.png", cubit.bmiModel.age, (){
                              cubit.minusAgeBody();
                            }, (){
                              cubit.addAgeBody();
                            }),
                      ],
                    ),
                    InkWell(
                        onTap: () async{
                          if (cubit.bmiModel.isFemale == true && cubit.bmiModel.isMale == false) {
                            cubit.calculateBmiForFemale();
                            cubit.printStatus();
                            cubit.getBmiColor();
                          }
                          else if (cubit.bmiModel.isFemale == false && cubit.bmiModel.isMale == true) {
                            cubit.calculateBmiForMale();
                            cubit.printStatus();
                            cubit.getBmiColor();
                          }
                          else if(cubit.bmiModel.isMale==false&&cubit.bmiModel.isFemale==false)
                          {
                            await AwesomeDialog(
                               context: context,
                               dialogBackgroundColor:const Color(0xFF0A0E21),
                               dialogType: DialogType.noHeader,
                               animType: AnimType.rightSlide,
                               padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                               titleTextStyle:const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                               descTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
                               title: 'BMI CALCULATOR',
                               desc: 'you must be select the type of gender.............',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                          ).show();
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => const BmiCalculatorHomeScreen(),));
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return  ResultBmi(finalValue: cubit.result?.round().toDouble(),
                              status: cubit.status,
                                color: cubit.getBmiColor(),
                              );
                            },
                          ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.09,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF10606),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: const Text(
                            "CALCULATE",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ]
              )
          );
        },
      ),
    );
  }
}

