part of 'ecomcubit_cubit.dart';

@immutable
sealed class EcomcubitState {}

final class EcomcubitLoading extends EcomcubitState {}
final class EcomcubitSuccess extends EcomcubitState {
  final List<Randomm> porand;
  EcomcubitSuccess( this.porand);
}
final class EcomcubitSuccess2 extends EcomcubitState{
    final Map<String, dynamic> data;
  EcomcubitSuccess2( this.data);
 
}
/*
final class EcomcubitSuccess3 extends EcomcubitState {
    final List<Fruits> pofruit;
  EcomcubitSuccess3(this.pofruit);
 
}
final class EcomcubitSuccess4 extends EcomcubitState {
    final List<Randomm> porand;
  EcomcubitSuccess4( this.porand);
}*/
final class EcomcubitFailure extends EcomcubitState {
 final String error;

  EcomcubitFailure(  {required this.error});

}