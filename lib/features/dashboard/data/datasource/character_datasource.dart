import 'package:rick_and_morty_app/features/dashboard/data/model/character_model.dart';
import 'package:rick_and_morty_app/features/dashboard/data/model/list_characters_model.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';
import 'package:rick_and_morty_app/share/base/datasource/datasource.dart';
import 'package:rick_and_morty_app/share/boundaries/http_connection/http_facade.dart';

class CharacterDataSource implements DataSource {
  final HttpFacade httpFacade;

  CharacterDataSource(
    this.httpFacade,
  );

  @override
  Future<ListCharactersEntity> call(
      {FromJson? fromJson, Map<String, dynamic>? param, dynamic data}) async {
    const method = HttpMethod.get;
    String endPoint = 'https://rickandmortyapi.com/api/character';

    final response = await httpFacade(method, endPoint);

    final characters = (response['results'] as List)
        .map((event) => CharacterModel.fromJson(event))
        .toList();

    final listCharacters = ListCharactersModel(characters);

    return listCharacters;

  }
}
