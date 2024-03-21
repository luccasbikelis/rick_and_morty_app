import 'dart:async';
import 'dart:convert';
import 'package:rick_and_morty_app/ui/dashboard/interactor/obtain_list_characters_interactor_receiver.dart';
import 'package:rick_and_morty_app/ui/dashboard/repository/obtain_list_characters_executor.dart';
import 'package:http/http.dart' as http;

class ObtainListCharactersRepository implements ObtainListCharactersExecutor {
  final ObtainListCharactersInteractorReceiver _receiver;
  ObtainListCharactersRepository(this._receiver);

  @override
  Future<void> execute() async {
    const String endPoint = 'https://rickandmortyapi.com/api/character';

    try {
      final response = await http.get(Uri.parse(endPoint));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        _receiver.receivedListCharactersDashboard(jsonData);
      }
    } on TimeoutException catch (timeoutException) {
      _receiver.receiveErrorObtainListCharacters(timeoutException);
    }
  }
}
