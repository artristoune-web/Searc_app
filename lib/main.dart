import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/models/company.dart';
import 'package:search_app/repositories/preferences_repository.dart';
import 'package:search_app/ui/screens/home.dart';
import 'package:search_app/ui/screens/search_address.dart';
import 'blocs/company_cubit.dart';
import 'ui/screens/add_company.dart';

void main() {
  // Pour pouvoir utiliser les SharePreferences avant le runApp
  WidgetsFlutterBinding.ensureInitialized();

  final PreferencesRepository preferencesRepository = PreferencesRepository();

  // Instanciation du Cubit
  final CompanyCubit companyCubit = CompanyCubit(preferencesRepository);

  // Chargement des entreprises
  companyCubit.loadCompanies();

  runApp(BlocProvider<CompanyCubit>(
    create: (_) => companyCubit,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      routes: {
        '/home': (context) => const Home(),
        '/add_company': (context) => const AddCompany(),
        '/search_address': (context) => const SearchCompany()
      },
      initialRoute: '/home',
    );
  }
}
