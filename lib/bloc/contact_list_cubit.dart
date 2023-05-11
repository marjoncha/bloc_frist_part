import 'package:bloc_frist_part/model/contact_model.dart';
import 'package:bloc_frist_part/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_list_state.dart';

class ContactListCubit extends Cubit<ContactListState>{
  ContactListCubit() : super(ContactListInit());


  Future<void> getApi()async{
    emit(LoadingState());
    try{
      List<Contact>? res =await ApiService.getListContact();
      emit (LoadedState(contacts: res ?? []));
    } catch(e){
      print(e);
      emit(ErrorState(error: e));
    }
  }
}

