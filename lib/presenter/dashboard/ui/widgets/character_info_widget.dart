import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';
import 'package:rick_and_morty_app/share/util/date_util.dart';

class CharacterInfoWidget extends StatelessWidget {
  final ListCharactersEntity character;
  final int index;

  const CharacterInfoWidget({
    Key? key,
    required this.character,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        character.listCharacters[index].created.formatString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            character.listCharacters[index].image,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return const SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: Text(
                    'Erro ao carregar imagem',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10,),
        textFormatted('NOME: ', character.listCharacters[index].name),
        textFormatted('DATA: ', formattedDate),
        textFormatted('STATUS: ', character.listCharacters[index].status),
        textFormatted('TIPO: ', character.listCharacters[index].type),
        textFormatted('ESPÉCIE: ', character.listCharacters[index].species),
        textFormatted('GÊNERO: ', character.listCharacters[index].gender),
        textFormatted(
            'ORIGEM: ', character.listCharacters[index].origin["name"]),
      ],
    );
  }

  RichText textFormatted(String text, String listText) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: listText,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
