import 'package:course_task/presentaion/screens/image_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/consts.dart';
import '../../data/cubits/popular_people_data_cubit/popular_people_data_cubit.dart';
import '../../data/cubits/popular_people_images_cubits/popular_people_images_cubit.dart';
import '../../domain/models/popular_people_images_model.dart';
import '../../data/cubits/popular_people_data_cubit/popular_people_data_cubit.dart';

class PopularPeopleDetailsScreen extends StatefulWidget {
  int? id;
  String? name;

  PopularPeopleDetailsScreen({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<PopularPeopleDetailsScreen> createState() =>
      _PopularPeopleDetailsScreenState();
}

class _PopularPeopleDetailsScreenState
    extends State<PopularPeopleDetailsScreen> {
  @override
  void initState() {
    PopularPeopleImagesCubit.get(context).getPopularPeopleImages(id: widget.id);
    PopularPeopleDataCubit.get(context).getPopularPeopleData(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularPeopleImagesCubit, PopularPeopleImagesState>(
      listener: (context, state) {
        state is PopularPeopleImagesError ? debugPrint('Error occured') : null;
      },
      builder: (context, state) {
        return state is PopularPeopleImagesLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.deepPurple,
                  title: Text('Details about ' + widget.name!),
                ),
                body: BlocConsumer<PopularPeopleDataCubit,
                    PopularPeopleDataState>(
                  listener: (context, state) {
                    state is PopularPeopleDataError
                        ? debugPrint('Error occured')
                        : null;
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(50))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Location of Birth : ${PopularPeopleDataCubit.get(context).popularPeopleDataModel.placeOfBirth ?? ''}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  // Text(
                                  //   'Date of Birth:' + PopularPeopleDataCubit.get(context).popularPeopleDataModel.birthday!,                      style: const TextStyle(color: Colors.white),
                                  // ),
                                  Text(
                                    'Date of Birth: ${PopularPeopleDataCubit.get(context).popularPeopleDataModel.birthday ?? ''}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                                itemCount: PopularPeopleImagesCubit.get(context)
                                    .popularPeopleImagesModel
                                    .profiles!
                                    .length,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 350,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ImagePreview(
                                                    image: AppConsts.baseUrl +
                                                        PopularPeopleImagesCubit
                                                                .get(context)
                                                            .popularPeopleImagesModel
                                                            .profiles![index]
                                                            .filePath!,
                                                  )));
                                    },
                                    child: Image.network(
                                      AppConsts.baseUrl +
                                          PopularPeopleImagesCubit.get(context)
                                              .popularPeopleImagesModel
                                              .profiles![index]
                                              .filePath!,
                                      height: 200,
                                      width: 300,
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
