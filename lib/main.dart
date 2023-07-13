import 'package:flutter/material.dart';
import 'package:voto_facil/config/routes/index.dart';
import 'package:voto_facil/config/theme/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = {
    '/': (context) => const LoginPage(),
    '/registro': (context) => const RegistroPage(),
    '/home': (context) => const HomePage(),
    '/perfil': (context) => const PerfilPage(),
    '/list_partidos_politicos': (context) => const ListadoPartidosPoliticos(),
    '/partido_politico': (context) => const PartidoPolitico(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).theme(),
      initialRoute: '/',
      routes: _routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      },
    );
  }
}
