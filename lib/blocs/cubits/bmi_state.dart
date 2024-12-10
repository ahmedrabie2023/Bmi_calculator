part of 'bmi_cubit.dart';

@immutable
sealed class BmiState {}

final class BmiInitial extends BmiState {}
final class ChangeTypeToFemale extends BmiState{}
final class ChangeTypeToMale extends BmiState{}
final class ChangeHeightSlider extends BmiState{}
final class AddWeightBody extends BmiState{}
final class MinusWeightBody extends BmiState{}
final class AddAgeBody extends BmiState{}
final class MinusAgeBody extends BmiState{}
final class CalculateStatusBodyForMale extends BmiState{}
final class CalculateStatusBodyForFemale extends BmiState{}
