import '../model/contact_model.dart';
import 'package:equatable/equatable.dart';

abstract class ContactListState extends Equatable{
  @override
  List<Contact> get props =>[];

  
}
class ContactListInit extends ContactListState{}
class LoadingState extends ContactListState{}
class LoadedState extends ContactListState{
  List<Contact> contacts;
  LoadedState({required this.contacts});
  @override
  List<Contact>get props=>contacts;
}
class ErrorState extends ContactListState{
  final error;
  ErrorState({required this.error});
}