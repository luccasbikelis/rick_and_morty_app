
import 'package:rick_and_morty_app/ui/dashboard/model/list_characters_entity.dart';

abstract class DashboardListener {
  void receivedListCharactersDashboard(ListCharactersEntity? listCharacter);
}
