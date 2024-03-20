import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/interactor/dashboard_interactor.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/interactor/dashboard_interactor_provider.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/presenter/dashboard_listener.dart';
import 'package:rick_and_morty_app/src/ui/dashboard/presenter/dashboard_provider.dart';

class DashboardPresenter extends ChangeNotifier implements DashboardProvider, DashboardListener {
  late DashboardInteractorProvider _interactor;
  ListCharactersEntity? _listCharacter;

  final listCharactersListenable = ValueNotifier<ListCharactersEntity?>(null);

  DashboardPresenter({DashboardInteractorProvider? interactor}) {
    _interactor = interactor ?? DashboardInteractor(this);
  }

  @override
  Future<ListCharactersEntity?> getListDashboard() async {
    await _interactor.getListDashboard();

    listCharactersListenable.value = _listCharacter;
    listCharactersListenable.notifyListeners();

    return _listCharacter;
  }

  @override
  void receiveListDashboard(ListCharactersEntity? listCharacter) {}

  // @override
  // Future<void> setListDashboard(List<CharacterEntity> listCharacter) {

  //   throw UnimplementedError();
  // }
}


// class ListCharactersController extends ChangeNotifier {
//   final CharacterUseCase characterUseCase;

//   final listCharactersListenable = ValueNotifier<ListCharactersEntity?>(null);

//   ListCharactersController(
//     this.characterUseCase,
//   );

//   Future<void> call() async {
//     try {
//       final useCase = await characterUseCase();

//       listCharactersListenable.value = useCase;
//       listCharactersListenable.notifyListeners();
//     } catch (error) {
//       Exception("Error");
//     }
//   }

 
// }
