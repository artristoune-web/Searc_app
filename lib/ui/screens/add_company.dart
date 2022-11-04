// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/blocs/company_cubit.dart';
import 'package:search_app/models/address.dart';
import 'package:search_app/repositories/address_repository.dart';

import '../../models/company.dart';

class AddCompany extends StatelessWidget {
  const AddCompany({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    Address? address;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Nouvelle Entreprise'),
          backgroundColor: Color.fromARGB(255, 0, 82, 91)),
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      body: Container(
        margin: EdgeInsets.all(25.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Card(
                elevation: 0,
                color: Color.fromARGB(255, 236, 236, 236),
                margin: EdgeInsets.all(10.0),
                child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.apartment,
                          color: Color.fromARGB(255, 0, 82, 91)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color.fromARGB(255, 0, 82, 91), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color.fromARGB(255, 0, 160, 178), width: 2)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: 'Nom de l\'entreprise',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 0, 82, 91)),
                      labelText: 'Nom de l\'entreprise',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 0, 82, 91)),
                    ),
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir une entreprise';
                      }
                      return null;
                    }),
              ),
              Card(
                elevation: 0,
                color: Color.fromARGB(255, 236, 236, 236),
                margin: EdgeInsets.all(10.0),
                child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on,
                          color: Color.fromARGB(255, 0, 82, 91)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color.fromARGB(255, 0, 82, 91), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color.fromARGB(255, 0, 160, 178), width: 2)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: 'Adresse de l\'entreprise',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 0, 82, 91)),
                      labelText: 'Adresse de l\'entreprise',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 0, 82, 91)),
                    ),
                    onTap: () async {
                      address = await Navigator.of(context).pushNamed('/search_address') as Address?;
                      if(address != null) {
                        addressController.text = '${address!.street}, ${address!.postcode} ${address!.city}';
                      }
                    },
                    controller: addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir une entreprise';
                      }
                      return null;
                    }),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 82, 91),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate() && address != null) {
                    final String name = nameController.text;
                    final Company company = Company(0, name, address!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Entreprise ajouté')),
                    );
                    context.read<CompanyCubit>().addCompany(company);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
