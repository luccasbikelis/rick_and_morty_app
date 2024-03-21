

import 'dart:convert';
import 'package:rick_and_morty_app/ui/dashboard/interactor/dashboard_interactor_receiver.dart';
import 'package:rick_and_morty_app/ui/dashboard/model/character_model.dart';
import 'package:rick_and_morty_app/ui/dashboard/model/list_characters_model.dart';
import 'package:rick_and_morty_app/ui/dashboard/repository/dashboard_executor.dart';
import 'package:http/http.dart' as http;

class DashboardRepository implements DashboardExecutor {
  final DashboardInteractorReceiver _receiver;
  DashboardRepository(this._receiver);

  @override
  Future<void> execute() async {
    const String endPoint = 'https://rickandmortyapi.com/api/character';

    try {
      final response = await http.get(Uri.parse(endPoint));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final characters = (jsonData['results'] as List)
            .map((character) => CharacterModel.fromJson(character))
            .toList();
        final listCharacters = ListCharactersModel(characters);
        _receiver.receivedListCharactersDashboard(listCharacters);
      } else {
        Exception('Erro: ${response.statusCode}');
      }
    } catch (e) {
      Exception('Erro: $e');
    }
  }
}
