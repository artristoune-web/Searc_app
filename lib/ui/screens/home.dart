// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/blocs/company_cubit.dart';

import '../../models/company.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Liste des entreprises'),
            backgroundColor: Color.fromARGB(255, 0, 82, 91)),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: const [
                  Color.fromARGB(255, 0, 82, 91),
                  Color.fromARGB(255, 0, 160, 178)
                ])),
            child: BlocBuilder<CompanyCubit, List<Company>>(
                builder: (context, companies) {
              return ListView.builder(
                itemCount: companies.length < 4 ? companies.length : 4,
                itemBuilder: (BuildContext context, int index) {
                  final Company company = companies[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    // ignore: sort_child_properties_last
                    child: ListTile(
                      contentPadding: EdgeInsets.all(15),
                      leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(Icons.apartment,
                              color: Color.fromARGB(255, 255, 255, 255))),
                      title: Text(
                        company.name,
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      subtitle: Text(
                          '${company.address.street}, ${company.address.postcode} ${company.address.city}',
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chevron_right,
                              color: Colors.black, size: 30)),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  );
                },
              );
            })),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushNamed('/add_company');
          },
          label: const Text('Nouvelle Entreprise',
              style: TextStyle(color: Colors.black)),
          icon: const Icon(Icons.add, color: Colors.black),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
