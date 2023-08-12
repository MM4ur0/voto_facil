import 'package:flutter/material.dart';
import 'package:voto_facil/config/routes/index.dart';
import 'package:voto_facil/config/theme/app_theme.dart';
import 'package:zog_ui/zog_ui.dart';

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
    '/cometarios': (context) => const CometariosPage(),
    '/voto_home': (context) => const votohomePage(),
    '/voto_votar': (context) => const votovotarPage(),
    '/papeleta': (context) => const PapeletaPage(),
    '/faq1': (context) => const Faq1Page(),
    '/lista_resultado': (context) => const ListaResultado(),
    '/home_resultado': (context) => const Resultado(),
  };

  @override
  Widget build(BuildContext context) {
    return ZeroApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
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
