// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:search_app/models/address.dart';
import 'package:search_app/repositories/address_repository.dart';

class SearchCompany extends StatefulWidget {
  const SearchCompany({super.key});

  @override
  State<SearchCompany> createState() => _SearchCompanyState();
}

class _SearchCompanyState extends State<SearchCompany> {
  List<Address> _addresses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Recherche adresse'),
          backgroundColor: Color.fromARGB(255, 0, 82, 91)),
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      body: Container(
        margin: EdgeInsets.all(25.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 0,
                color: Color.fromARGB(255, 236, 236, 236),
                child: TextField(
                  onChanged: (value) async {
                    if(value.length >= 3){
                      final AddressRepository addressRepository = AddressRepository();
                      List<Address> addresses = await addressRepository.fetchAddresses(value);
                      setState(() {
                        _addresses = addresses;
                      });
                    }
                  },
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
                    hintText: 'Entrer une adresse',
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 82, 91)),
                    labelText: 'Adresse de l\'entreprise',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 82, 91)),
                  ),
                ),
              ),
              Expanded(
                  child: Card(
                child: ListView.separated(
                  itemCount: _addresses.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(height: 0),
                  itemBuilder: (BuildContext context, int index) {
                    final Address address = _addresses[index];
                    return ListTile(
                      title: Text(address.street),
                      subtitle: Text('${address.postcode} ${address.city}'),
                      onTap: () {
                        Navigator.of(context).pop(address);
                      },
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
