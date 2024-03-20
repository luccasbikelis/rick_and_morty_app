import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/interactor/dashboard_interactor_provider.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/interactor/dashboard_interactor_receiver.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/repository/dashboard_executor.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/presenter/dashboard_listener.dart';

class DashboardInteractor implements DashboardInteractorProvider, DashboardInteractorReceiver {
  final DashboardListener? _listener;
  late DashboardExecutor _repository;

  DashboardInteractor(this._listener, {DashboardExecutor? repository}) {
    _repository = repository ?? DashboardExecutor(this);
  }

  @override
  Future<void> getListDashboard() async {
    await _repository.getListDashboard();
  }

  @override
  void receiveListDashboard(ListCharactersEntity? listCharacter) {
    _listener!.receiveListDashboard(listCharacter);
  }

 
}
