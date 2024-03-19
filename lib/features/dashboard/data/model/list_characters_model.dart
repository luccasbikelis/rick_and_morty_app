import 'package:rick_and_morty_app/features/dashboard/data/model/character_model.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';
import 'package:rick_and_morty_app/share/base/model/model.dart';

class ListCharactersModel extends ListCharactersEntity implements Model {
  ListCharactersModel(
    final List<CharacterEntity> listCharacters,
  ) : super(listCharacters);

  @override
  Map<String, dynamic> toMap() {
    return {
      'results': listCharacters
          .map((characters) => CharacterModel.copy(characters).toMap())
          .toList(),
    };
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  factory ListCharactersModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> charactersJson = json['results'];
    List<CharacterModel> characters = charactersJson
        .map((character) => CharacterModel.fromJson(character))
        .toList();
    return ListCharactersModel(characters);
  }

  factory ListCharactersModel.copy(ListCharactersEntity listClassRoomEntity) {
    return ListCharactersModel(
      listClassRoomEntity.listCharacters,
    );
  }
}
