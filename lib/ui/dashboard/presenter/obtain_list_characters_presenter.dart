import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/ui/dashboard/interactor/obtain_list_characters_interactor.dart';
import 'package:rick_and_morty_app/ui/dashboard/interactor/obtain_list_characters_interactor_provider.dart';
import 'package:rick_and_morty_app/ui/dashboard/model/list_characters_entity.dart';
import 'package:rick_and_morty_app/ui/dashboard/presenter/obtain_list_characters_listener.dart';
import 'package:rick_and_morty_app/ui/dashboard/presenter/obtain_list_characters_provider.dart';

class ObtainListCharactersPresenter extends ChangeNotifier
    implements ObtainListCharactersProvider, ObtainListCharactersListener {
  late ObtainListCharactersInteractorProvider _interactor;

  final listCharactersListenable = ValueNotifier<ListCharactersEntity?>(null);

  final errorObtainlistCharactersListenable = ValueNotifier<Exception?>(null);

  ObtainListCharactersPresenter(
      {ObtainListCharactersInteractorProvider? interactor}) {
    _interactor = interactor ?? ObtainListCharactersInteractor(this);
  }

  @override
  void obtainListCharacters() {
    _interactor.obtainListCharacters();
  }

  @override
  void receivedListCharactersDashboard(ListCharactersEntity? listCharacter) {
    listCharactersListenable.value = listCharacter;
    listCharactersListenable.notifyListeners();
  }

  @override
  void receiveErrorObtainListCharacters(Exception? exception) {
    errorObtainlistCharactersListenable.value = exception;
    errorObtainlistCharactersListenable.notifyListeners();
  }

  @override
  dispose() {
    super.dispose();
    listCharactersListenable.dispose();
  }
}
