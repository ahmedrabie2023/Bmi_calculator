import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/bmi_model.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());
  static BmiCubit get(context) => BlocProvider.of(context);
  double? result;
  String status="";
  BmiModel bmiModel =
  BmiModel(height: 20.0, weight: 7, age: 0, isFemale: false, isMale: false);
  changeFemale(){
    bmiModel.isFemale=true;
    bmiModel.isMale=false;
    emit(ChangeTypeToFemale());
  }
  changeMale(){
    bmiModel.isFemale=false;
    bmiModel.isMale=true;
    emit(ChangeTypeToMale());
  }
  changeSliderHeight(value) {
    bmiModel.height =value;
    emit(ChangeHeightSlider());
  }
  minusWeightBody(){
    bmiModel.weight--;
    emit(MinusWeightBody());
  }
  addWeightBody(){
    bmiModel.weight++;
    emit(AddWeightBody());
  }
  minusAgeBody(){
    bmiModel.age--;
    emit(MinusAgeBody());
  }
  addAgeBody(){
    bmiModel.age++;
    emit(AddAgeBody());
  }
  calculateBmiForMale(){
    result = (bmiModel.weight/((bmiModel.height/100)*(bmiModel.height/100)));
  }
  calculateBmiForFemale(){
    result = ((bmiModel.weight+0.5)/((bmiModel.height/100)*(bmiModel.height/100)));
  }
  printStatus(){
    if(result! < 16.0)
    {
      status= "Severely Underweight";
    }
    else if(result!>=10.0&&result!<=18.4)
    {
      status= "Underweight";
    }
    else if(result!>=18.5&&result!<=24.9)
    {
      status="Normal";
    }
    else if(result!>=25&&result!<=29.9)
    {
      status= "Overweight";
    }
    else if(result!>=30&&result!<=34.9)
    {
      status= " Obese Class|";
    }
    else if(result!>=35&&result!<=39.9)
    {
      status= "Obese Class||";
    }
    else if(result!>=40)
    {
      status= "Obese Class|||";
    }
  }
  getBmiColor(){
    switch(status)
    {
      case "Severely Underweight":
        return Colors.red;
      case "Underweight":
        return Colors.blue;
      case "Normal" :
        return Colors.green;
      case "Overweight" :
        return Colors.orange;
      case  " Obese Class|"|| "Obese Class||"|| "Obese Class|||":
        return Colors.red;
    }
  }
}
