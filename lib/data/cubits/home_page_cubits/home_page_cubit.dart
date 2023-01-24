import 'package:bloc/bloc.dart';
import 'package:course_task/data/requests/home_screen_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  static HomePageCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  logIn({required String? email , required String? password}){
    emit(HomePageLoading());
    HomeScreenRequest.UserAuthrequest(email: email, password: password, onSuccess: (){}, onError: (error){});
emit(HomePageLoaded());
  }

}
