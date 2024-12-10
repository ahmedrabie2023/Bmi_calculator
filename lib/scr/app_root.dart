import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cubits/bmi_cubit.dart';
import '../views/splach_screen_bmi.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [BlocProvider(create: (BuildContext context) => BmiCubit(),)],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenBmi(),
      ),
    );
  }
}
