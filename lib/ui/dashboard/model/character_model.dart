


import 'package:rick_and_morty_app/share/base/model/model.dart';
import 'character_entity.dart';

class CharacterModel extends CharacterEntity implements Model {
  CharacterModel(super.name, super.image, super.status, super.type,
      super.species, super.gender, super.origin, super.created, super.episode);

  @override
  Map<String, dynamic> toMap() => {
        'name': name,
        'image': image,
        'status': status,
        'type': type,
        'species': species,
        'gender': gender,
        'origin': origin,
        'created': created,
        'episode': episode,
      };

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      json['name'] ?? '',
      json['image'] ?? '',
      json['status'] ?? '',
      json['type'] ?? '',
      json['species'] ?? '',
      json['gender'] ?? '',
      json['origin'] ?? {},
      json['created'] ?? '',
      json['episode'] ?? [],
    );
  }

  factory CharacterModel.copy(CharacterEntity characterEntity) {
    return CharacterModel(
      characterEntity.name,
      characterEntity.image,
      characterEntity.status,
      characterEntity.type,
      characterEntity.species,
      characterEntity.gender,
      characterEntity.origin,
      characterEntity.created,
      characterEntity.episode
    );
  }
}
