import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:iti_project/features/data/models/Random.dart';
import 'package:iti_project/features/data/repositrys/Repos.dart';
import 'package:meta/meta.dart';

part 'ecomcubit_state.dart';

class EcomcubitCubit extends Cubit<EcomcubitState> {
    final DioService dioService;
  EcomcubitCubit(this.dioService) : super(EcomcubitLoading()){
    fetchRandom();
    //fetchdrinks();
   // fetchfruits();
    //fetchfoods
    fetchData();
  }
  PostRandom rerand = PostRandom();
  void fetchRandom() async {
    try {
      List<Randomm> porand = await rerand.fetchRandom();
      emit(EcomcubitSuccess(porand));
    }
    on DioException catch(ex) {
      if(ex.type==DioExceptionType) {
        emit( EcomcubitFailure(error: 'error') );
      }
      else {
        emit( EcomcubitFailure( error: 'error') );
      }
    }
  }
  //PostFood refood = PostFood();
  Future<void> fetchData() async {
    try {
      emit(EcomcubitLoading());
     final data = await dioService.getRequest();
      emit(EcomcubitSuccess2(data));
    } catch (e) {
      emit(EcomcubitFailure(error: 'error'));
    }
  }
   /*Drinkss redrink = Drinkss();
  void fetchdrinks() async {
    try {
      List<Drinnks> podrink = await redrink.fetchdrinks();
      emit(EcomcubitSuccess2(podrink));
    }
    on DioException catch(ex) {
      if(ex.type==DioExceptionType) {
        emit( EcomcubitFailure(error: 'error') );
      }
      else {
        emit( EcomcubitFailure( error: 'error') );
      }
    }
  }
  PostFruit refruit = PostFruit();

  void fetchfruits() async {
    try {
      List<Fruits> pofruit = await refruit.fetchfruits();
      emit(EcomcubitSuccess3(pofruit));
    }
    on DioException catch(ex) {
      if(ex.type==DioExceptionType) {
        emit( EcomcubitFailure(error: 'error') );
      }
      else {
        emit( EcomcubitFailure( error: 'error') );
      }
    }
  }
   PostRandom rerand = PostRandom();
  void fetchRandom() async {
    try {
      List<Randomm> porand = await rerand.fetchRandom();
      emit(EcomcubitSuccess4(porand));
    }
    on DioException catch(ex) {
      if(ex.type==DioExceptionType) {
        emit( EcomcubitFailure(error: 'error') );
      }
      else {
        emit( EcomcubitFailure( error: 'error') );
      }
    }
  }*/
   
}


 


