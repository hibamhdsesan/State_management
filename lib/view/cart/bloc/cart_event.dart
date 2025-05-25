// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}


class ViewCart extends CartEvent {}

class IncreasProductQuintity extends CartEvent {
  String id;
  IncreasProductQuintity({
    required this.id,
  });
}

class ViewOneProduct extends CartEvent {
  String id;
  ViewOneProduct({
    required this.id,
  });
}



class IncreasProductQuintityFromDetails extends CartEvent {
  String id;
  IncreasProductQuintityFromDetails({
    required this.id,
  });
}