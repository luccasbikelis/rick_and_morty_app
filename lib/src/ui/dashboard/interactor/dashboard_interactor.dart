import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';
import 'package:rick_and_morty_app/share/boundaries/http_connection/http_facade.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/interactor/dashboard_interactor_provider.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/interactor/dashboard_interactor_receiver.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/repository/dashboard_executor.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/repository/dashboard_repository.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/presenter/dashboard_listener.dart';

class DashboardInteractor implements DashboardInteractorProvider, DashboardInteractorReceiver {
  final DashboardListener? _listener;
  late DashboardRepository _repository;
  late HttpFacade _facade;

  DashboardInteractor(this._listener, {DashboardRepository? repository}) {
    _repository = repository ?? DashboardExecutor(this, _facade);
  }

  @override
  Future<void> getListDashboard() async {
    await _repository.getListDashboard();
  }

  @override
  void receiveListDashboard(ListCharactersEntity? listCharacter) {
    _listener!.receiveListDashboard(listCharacter);
  }

  // @override
  // void setListDashboard(List<CharacterEntity>? listCharacter) {
  //   _origin.setListDashboard(listCharacter);
  // }
}
