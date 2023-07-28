import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class Comment {
  final String username;
  final String comment;

  Comment(this.username, this.comment);
}

class CometariosPage extends StatefulWidget {
  const CometariosPage({super.key});

  @override
  State<CometariosPage> createState() => _CometariosPageState();
}

class _CometariosPageState extends State<CometariosPage> {
  final TextEditingController _commentController = TextEditingController();
  List<Comment> _comments = [];
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    _comments = [
      Comment("Jesus Acosta", "Estan buenas las ideas expuestas en el plan!"),
      Comment("Emily Gonzalez",
          "Este plan político promete impulsar, pero requerira una buena implementación"),
      Comment("Jorge Charco",
          "El enfoque de este político en la educación es alentador, sin embargo, es fundamentar asegurar que se destinen bien los recursos"),
      Comment("Manuel Montalvan",
          "La promesa de este político de fortalecer la seguridad es importante, pero será vital equilibar las medidas de aplicación de la ley"),
      Comment("Maria Lopez",
          "Me preocupa cómo se abordará el tema de la salud en este plan político."),
      Comment("Carlos Ramirez",
          "El enfoque en el medio ambiente es necesario, pero se necesitarán acciones concretas para hacer frente al cambio climático."),
      Comment("Laura Mendoza",
          "Espero que este político tenga un enfoque inclusivo que atienda a todas las comunidades."),
      Comment("Pedro Perez",
          "Me gustaría ver más detalles sobre cómo se financiará este plan político."),
      Comment("Ana Garcia",
          "El plan para fomentar el empleo es alentador, pero es importante considerar también la calidad de los empleos generados."),
      Comment("Luis Torres",
          "¿Cuál será la postura de este político frente a temas de igualdad y derechos humanos?"),
      Comment("Sofia Martinez",
          "Espero que este plan político tenga en cuenta a los sectores más vulnerables de la sociedad."),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _addComment() {
    String commentText = _commentController.text.trim();
    if (commentText.isNotEmpty) {
      setState(() {
        _comments.add(Comment("Fabrizio Ramos", commentText));
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Comentarios",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ZeroColors.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _comments.length,
                  itemBuilder: (context, index) {
                    return FadeIn(
                      duration: const Duration(seconds: 1),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(
                              _comments[index].username,
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            subtitle: Text(_comments[index].comment,
                                style: const TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _commentController,
                onTapOutside: (event) {
                  focusNode.unfocus();
                },
                focusNode: focusNode,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Dejanos un comentario',
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(40)),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send_outlined),
                    onPressed: () {
                      _addComment();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
