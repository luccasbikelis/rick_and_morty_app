import 'package:rick_and_morty_app/ui/dashboard/model/character_model.dart';
import 'package:rick_and_morty_app/ui/dashboard/model/list_characters_model.dart';
import 'package:rick_and_morty_app/ui/dashboard/presenter/obtain_list_characters_listener.dart';
import 'package:rick_and_morty_app/ui/dashboard/repository/obtain_list_characters_executor.dart';
import 'package:rick_and_morty_app/ui/dashboard/repository/obtain_list_characters_repository.dart';
import 'obtain_list_characters_interactor_provider.dart';
import 'obtain_list_characters_interactor_receiver.dart';

class ObtainListCharactersInteractor
    implements
        ObtainListCharactersInteractorProvider,
        ObtainListCharactersInteractorReceiver {
  final ObtainListCharactersListener? _listener;
  late ObtainListCharactersExecutor _repository;

  ObtainListCharactersInteractor(this._listener,
      {ObtainListCharactersRepository? repository}) {
    _repository = repository ?? ObtainListCharactersRepository(this);
  }

  @override
  void obtainListCharacters() {
    _repository.execute();
  }

  @override
  void receivedListCharactersDashboard(Map<String, dynamic>? result) {
    final characters = (result!['results'] as List)
        .map((character) => CharacterModel.fromJson(character))
        .toList();
    final listCharacter = ListCharactersModel(characters);

    _listener!.receivedListCharactersDashboard(listCharacter);
  }
  
  @override
  void receiveErrorObtainListCharacters(Exception? exception) {
   _listener!.receiveErrorObtainListCharacters(exception);
  }
}
