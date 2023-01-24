part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}
class HomePageLoading extends HomePageState {}
class HomePageLoaded extends HomePageState {}
class HomePageError extends HomePageState {}
