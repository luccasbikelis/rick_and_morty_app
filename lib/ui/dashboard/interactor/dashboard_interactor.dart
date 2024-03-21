

import 'package:rick_and_morty_app/ui/dashboard/model/list_characters_entity.dart';
import 'package:rick_and_morty_app/ui/dashboard/presenter/dashboard_listener.dart';
import 'package:rick_and_morty_app/ui/dashboard/repository/dashboard_executor.dart';
import 'package:rick_and_morty_app/ui/dashboard/repository/dashboard_repository.dart';
import 'dashboard_interactor_provider.dart';
import 'dashboard_interactor_receiver.dart';

class DashboardInteractor implements DashboardInteractorProvider, DashboardInteractorReceiver {
  final DashboardListener? _listener;
  late DashboardExecutor _repository;

  DashboardInteractor(this._listener, {DashboardRepository? repository}) {
    _repository = repository ?? DashboardRepository(this);
  }

  @override
  Future<void> getListDashboard() async {
    await _repository.execute();
  }

  @override
  void receivedListCharactersDashboard(ListCharactersEntity? listCharacter) {
    _listener!.receivedListCharactersDashboard(listCharacter);
  }

 
}
