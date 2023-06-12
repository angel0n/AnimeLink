import 'package:anime_link/components/custom_text_field.dart';
import 'package:anime_link/components/navigation_drawer.dart';
import 'package:flutter/material.dart';

class BuscaScreen extends StatefulWidget {
  const BuscaScreen({super.key});

  @override
  State<BuscaScreen> createState() => _BuscaScreenState();
}

class _BuscaScreenState extends State<BuscaScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimeLink"),
      ),
      drawer: const CustomNavigationDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              controller: controller,
              label: "Buscar Animes",
            ),
          )
        ],
      ),
    );
  }
}
