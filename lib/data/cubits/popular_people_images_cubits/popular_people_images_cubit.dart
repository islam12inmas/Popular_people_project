
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/popular_people_images_model.dart';
import '../../requests/popular_people_images_request.dart';

part 'popular_people_images_state.dart';

class PopularPeopleImagesCubit extends Cubit<PopularPeopleImagesState> {
  PopularPeopleImagesCubit() : super(PopularPeopleImagesInitial());
  static PopularPeopleImagesCubit get(context) => BlocProvider.of(context);
  PopularPeopleImagesModel popularPeopleImagesModel =PopularPeopleImagesModel(profiles: [], images: []);
  getPopularPeopleImages({int ?id}){
    emit(PopularPeopleImagesLoading());
    PopularPeopleImagesRequest.getPopularPeopleImages(
      id: id,
      onSuccess: (popularPeopleImagesList){
        popularPeopleImagesModel.profiles=[];
        popularPeopleImagesModel.profiles?.addAll(popularPeopleImagesList??[]) ;
        emit(PopularPeopleImagesLoaded());
      },
      onError: (error){
        emit(PopularPeopleImagesError());
      },
    );
  }
}

