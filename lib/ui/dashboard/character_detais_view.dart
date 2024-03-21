

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/design_system/colors/ds_colors.dart';
import 'package:rick_and_morty_app/ui/dashboard/components/character_info_widget.dart';
import 'package:rick_and_morty_app/ui/dashboard/model/list_characters_entity.dart';

class CharacterDetailsView extends StatelessWidget {
  final ListCharactersEntity character;
  final int index;

  const CharacterDetailsView(
      {Key? key, required this.character, required this.index})
      : super(key: key);
  static const routeName = '/character_details_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Personagem'),
        backgroundColor: DSColors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CharacterInfoWidget(character: character, index: index),
              const SizedBox(height: 10),
                widgetListEpisodes()
            ],
          ),
        ),
       
      ),
    );
  }

  Widget widgetListEpisodes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        const Text("Lista de Episódios",
        style:  TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: DSColors.blue),),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: character.listCharacters[index].episode.length,
            itemBuilder: (BuildContext context, int episodeIndex) {
              return ListTile(
                title:
                    Text(character.listCharacters[index].episode[episodeIndex]),
              );
            },
          ),
      ],
    );
  }

  RichText textFormatted(String text, String listText) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: DSColors.purple),
        children: <TextSpan>[
          TextSpan(
            text: listText,
            style: const TextStyle(fontSize: 14, color: DSColors.black),
          ),
        ],
      ),
    );
  }
}
