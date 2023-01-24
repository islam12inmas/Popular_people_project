part of 'popular_people_cubit.dart';

abstract class PopularPeopleState extends Equatable {
  const PopularPeopleState();
}

class PopularPeopleInitial extends PopularPeopleState {
  @override
  List<Object> get props => [];
}
class PopularPeopleLoading extends PopularPeopleState {
  @override
  List<Object> get props => [];
}
class PopularPeopleLoaded extends PopularPeopleState {
  @override
  List<Object> get props => [];
}
class PopularPeopleError extends PopularPeopleState {
  final int error;
  const PopularPeopleError(this.error);
  @override
  List<Object> get props => [];
}
