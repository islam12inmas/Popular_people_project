import 'package:course_task/data/cubits/popular_people_cubit/popular_people_cubit.dart';
import 'package:course_task/presentaion/screens/popular_people_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularPeopleScreen extends StatefulWidget {
  const PopularPeopleScreen({Key? key}) : super(key: key);

  @override
  State<PopularPeopleScreen> createState() => _PopularPeopleScreenState();
}

class _PopularPeopleScreenState extends State<PopularPeopleScreen> {
  @override
  void initState() {
    PopularPeopleCubit.get(context).getPopularPeople();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('popular list'),
      ),
      body: BlocConsumer<PopularPeopleCubit, PopularPeopleState>(
        listener: (context, state) {
          State is PopularPeopleError ? debugPrint('error occurred') : null;
        },
        builder: (context, state) {
          return state is PopularPeopleLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ))
              : ListView.builder(
                  itemCount: PopularPeopleCubit.get(context)
                      .popularPeopleModel
                      .results
                      ?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PopularPeopleDetailsScreen(
                                        name:  PopularPeopleCubit.get(context)
                                            .popularPeopleModel
                                            .results![index]
                                            .name!,
                                        id: PopularPeopleCubit.get(context)
                                            .popularPeopleModel
                                            .results![index]
                                            .id,
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.deepPurple,
                          ),
                          height: 120,
                          child:
                              Center(
                                child: Text(
                                  PopularPeopleCubit.get(context)
                                      .popularPeopleModel
                                      .results![index]
                                      .name!,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),


                        ),
                      ),
                    );
                  });
        },
      ),
    );
  }
}
