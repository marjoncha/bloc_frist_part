import 'package:bloc_frist_part/bloc/contact_list_cubit.dart';
import 'package:bloc_frist_part/bloc/contact_list_state.dart';
import 'package:bloc_frist_part/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ContactListCubit>(context).getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC One Part"),
      ),
      body: BlocBuilder<ContactListCubit, ContactListState>(
        builder: (context, state) {
          if (state is LoadingState || state is ContactListInit) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text("error"),
            );
          } else {
            List<Contact> contactlar = state.props;
            return ListView.builder(
              itemCount: contactlar.length,
              itemBuilder: ((context, index) => Container(
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          backgroundImage: NetworkImage(contactlar[index].avatar)
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  contactlar[index].name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  contactlar[index].phone,
                                  style: TextStyle(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          }
        },
      ),
    );
  }
}