import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';

abstract class DashboardProvider {
  // Future<void> setListDashboard(List<CharacterEntity> listCharacter);
  Future<ListCharactersEntity?> getListDashboard();
}
