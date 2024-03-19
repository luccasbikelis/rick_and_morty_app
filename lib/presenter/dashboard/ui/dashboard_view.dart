import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/design_system/colors/ds_colors.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';
import 'package:rick_and_morty_app/presenter/dashboard/controllers/list_characters_controller.dart';
import 'package:rick_and_morty_app/presenter/dashboard/ui/character_detais_view.dart';
import 'package:rick_and_morty_app/presenter/dashboard/ui/widgets/character_info_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);
  static const routeName = '/dashboard_view';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

final listCharactersController = GetIt.I<ListCharactersController>();

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    listCharactersController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rick and Morty',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: DSColors.white)),
        backgroundColor: DSColors.blue,
      ),
      body: ValueListenableBuilder<ListCharactersEntity?>(
          valueListenable: listCharactersController.listCharactersListenable,
          builder: (context, snapshot, _) {
            if (snapshot == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.listCharacters.isEmpty) {
              return const Center(
                child: Text('Lista de personagens vazia.'),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.listCharacters.length,
                      itemBuilder: (BuildContext context, int index) {
                        final character = snapshot;
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    CharacterDetailsView.routeName,
                                    arguments: {
                                      "character": character,
                                      "index": index
                                    });
                              },
                              child: Card(
                                child: ListTile(
                                    title: Column(children: [

                                      CharacterInfoWidget(
                                  character: character,
                                  index: index,
                                ),
                              
                                    ],)),
                              ),
                            ));
                      }),
                )
              ],
            );
          }),
    );
  }

  RichText textFormatted(String text, String listText) {
    return RichText(
        text: TextSpan(
            text: text,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: DSColors.blue),
            children: <TextSpan>[
          TextSpan(
            text: listText,
            style: const TextStyle(fontSize: 14, color: DSColors.black),
          )
        ]));
  }
}
