
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/repository/character_repository.dart';

abstract class CharacterUseCase {
  Future<ListCharactersEntity> call();
}

class CharacterUseCaseImpl implements CharacterUseCase {
  final CharacterRepository repository;

  CharacterUseCaseImpl(this.repository);

  @override
  Future<ListCharactersEntity> call() async {
    return await repository();
  }
}