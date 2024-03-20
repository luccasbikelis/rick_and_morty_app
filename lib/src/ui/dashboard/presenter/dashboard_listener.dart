import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';

abstract class DashboardListener {
  void receiveListDashboard(ListCharactersEntity? listCharacter);
}
