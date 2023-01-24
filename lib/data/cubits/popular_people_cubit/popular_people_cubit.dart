import 'package:bloc/bloc.dart';
import 'package:course_task/data/requests/popular_people_requset.dart';
import 'package:course_task/domain/models/popular_pepole_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_people_state.dart';

class PopularPeopleCubit extends Cubit<PopularPeopleState> {
  PopularPeopleCubit() : super(PopularPeopleInitial());


  static PopularPeopleCubit get(context) => BlocProvider.of(context);
  PopularPeopleModel popularPeopleModel =PopularPeopleModel(results: []);
  getPopularPeople(){

    emit(PopularPeopleLoading());
    PopularPeopleRequest.getPopularPeople(
      onSuccess: (popularPeopleList){
        popularPeopleModel.results=[];
        popularPeopleModel.results?.addAll(popularPeopleList??[]) ;
        emit(PopularPeopleLoaded());
      },
      onError: (error){
        emit(PopularPeopleError(error));
      },
    );
  }
}
