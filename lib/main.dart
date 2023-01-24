import 'package:course_task/data/cubits/popular_people_cubit/popular_people_cubit.dart';
import 'package:course_task/data/cubits/popular_people_data_cubit/popular_people_data_cubit.dart';
import 'package:course_task/data/cubits/popular_people_images_cubits/popular_people_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentaion/screens/popular_people_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiBlocProvider(providers: [BlocProvider<PopularPeopleCubit>(
      create: (BuildContext context) => PopularPeopleCubit(),
    ),
      BlocProvider<PopularPeopleImagesCubit>(
        create: (BuildContext context) => PopularPeopleImagesCubit()),
    BlocProvider<PopularPeopleDataCubit>(
  create: (BuildContext context) => PopularPeopleDataCubit()
      )], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PopularPeopleScreen());
  }
}
