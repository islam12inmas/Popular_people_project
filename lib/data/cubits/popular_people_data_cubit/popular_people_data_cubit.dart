import 'package:bloc/bloc.dart';
import 'package:course_task/data/requests/popular_people_data_request.dart';
import 'package:course_task/domain/models/popular_people_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../popular_people_cubit/popular_people_cubit.dart';

part 'popular_people_data_state.dart';

class PopularPeopleDataCubit extends Cubit<PopularPeopleDataState> {
  PopularPeopleDataCubit() : super(PopularPeopleDataInitial());


  static PopularPeopleDataCubit get(context) => BlocProvider.of(context);
  PopularPeopleDataModel popularPeopleDataModel = PopularPeopleDataModel();
  getPopularPeopleData(int? id){
    emit(PopularPeopleDataLoading());
    PopularPeopleDataRequest.getPopularPeopleData( id: id,
        onSuccess: (popularPeopleData){
          popularPeopleDataModel=popularPeopleData;

emit(PopularPeopleDataLoaded());
        },
        onError: (error){emit(PopularPeopleDataError());
    });
}}
