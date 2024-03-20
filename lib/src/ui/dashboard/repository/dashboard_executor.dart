import 'package:rick_and_morty_app/features/dashboard/data/model/character_model.dart';
import 'package:rick_and_morty_app/features/dashboard/data/model/list_characters_model.dart';
import 'package:rick_and_morty_app/share/boundaries/http_connection/http_facade.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/interactor/dashboard_interactor_receiver.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/repository/dashboard_repository.dart';

class DashboardExecutor implements DashboardRepository {
  final HttpFacade httpFacade;
  final DashboardInteractorReceiver _receiver;
  DashboardExecutor(this._receiver, this.httpFacade);

  @override
  Future<void> getListDashboard() async {
    const method = HttpMethod.get;
    String endPoint = 'https://rickandmortyapi.com/api/character';

    final response = await httpFacade(method, endPoint);

    final characters = (response['results'] as List).map((event) => CharacterModel.fromJson(event)).toList();

    final listCharacters = ListCharactersModel(characters);

    _receiver.receiveListDashboard(listCharacters);

    // return listCharacters;
  }

  // @override
  // void setListDashboard(List<CharacterEntity>? listCharacter) {

  // }
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