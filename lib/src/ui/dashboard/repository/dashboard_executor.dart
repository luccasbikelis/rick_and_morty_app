import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/features/dashboard/data/model/character_model.dart';
import 'package:rick_and_morty_app/features/dashboard/data/model/list_characters_model.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/interactor/dashboard_interactor_receiver.dart';

class DashboardExecutor 
// implements DashboardRepository
 {
  final DashboardInteractorReceiver _receiver;
  DashboardExecutor(this._receiver);

  
  Future<void> getListDashboard() async {
    const String endPoint = 'https://rickandmortyapi.com/api/character';

    try {
      final response = await http.get(Uri.parse(endPoint));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final characters = (jsonData['results'] as List).map((character) => CharacterModel.fromJson(character)).toList();
        final listCharacters = ListCharactersModel(characters);
        _receiver.receiveListDashboard(listCharacters);
      } else {
        print('Erro: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}



// class CharacterDataSource implements DataSource {
//   final HttpFacade httpFacade;

//   CharacterDataSource(
//     this.httpFacade,
//   );

//   @override
//   Future<ListCharactersEntity> call(
//       {FromJson? fromJson, Map<String, dynamic>? param, dynamic data}) async {
//     const method = HttpMethod.get;
//     String endPoint = 'https://rickandmortyapi.com/api/character';

//     final response = await httpFacade(method, endPoint);

//     final characters = (response['results'] as List)
//         .map((event) => CharacterModel.fromJson(event))
//         .toList();

//     final listCharacters = ListCharactersModel(characters);

//     return listCharacters;

//   }
// }