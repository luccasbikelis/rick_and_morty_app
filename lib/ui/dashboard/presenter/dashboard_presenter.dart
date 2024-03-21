

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/ui/dashboard/interactor/dashboard_interactor.dart';
import 'package:rick_and_morty_app/ui/dashboard/interactor/dashboard_interactor_provider.dart';
import 'package:rick_and_morty_app/ui/dashboard/model/list_characters_entity.dart';
import 'package:rick_and_morty_app/ui/dashboard/presenter/dashboard_listener.dart';
import 'package:rick_and_morty_app/ui/dashboard/presenter/dashboard_provider.dart';

class DashboardPresenter extends ChangeNotifier implements DashboardProvider, DashboardListener {
  late DashboardInteractorProvider _interactor;
  ListCharactersEntity? _listCharacter;

  final listCharactersListenable = ValueNotifier<ListCharactersEntity?>(null);

  DashboardPresenter({DashboardInteractorProvider? interactor}) {
    _interactor = interactor ?? DashboardInteractor(this);
  }

  @override
  Future<void> getListCharactersDashboard() async {
    await _interactor.getListDashboard();


    listCharactersListenable.value = _listCharacter;
    listCharactersListenable.notifyListeners();
  }

  @override
  void receivedListCharactersDashboard(ListCharactersEntity? listCharacter) {
    _listCharacter = listCharacter;
  }
}
