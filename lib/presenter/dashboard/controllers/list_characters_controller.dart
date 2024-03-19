import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/usecase/character_usecase.dart';

class ListCharactersController extends ChangeNotifier {
  final CharacterUseCase characterUseCase;

  final listCharactersListenable = ValueNotifier<ListCharactersEntity?>(null);

  ListCharactersController(
    this.characterUseCase,
  );

  Future<void> call() async {
    try {
      final useCase = await characterUseCase();

      listCharactersListenable.value = useCase;
      listCharactersListenable.notifyListeners();
    } catch (error) {
      Exception("Error");
    }
  }

 
}
