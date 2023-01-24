part of 'popular_people_data_cubit.dart';

@immutable
abstract class PopularPeopleDataState {}

class PopularPeopleDataInitial extends PopularPeopleDataState {}
class PopularPeopleDataLoading extends PopularPeopleDataState {}
class PopularPeopleDataLoaded extends PopularPeopleDataState {}
class PopularPeopleDataError extends PopularPeopleDataState {}
