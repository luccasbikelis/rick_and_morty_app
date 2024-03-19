import 'package:rick_and_morty_app/features/dashboard/data/model/list_characters_model.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_characters_entity.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/repository/character_repository.dart';
import 'package:rick_and_morty_app/share/base/datasource/datasource.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final DataSource dataSource;

  CharacterRepositoryImpl(this.dataSource);

  @override
  Future<ListCharactersEntity> call() async {
    return await dataSource(fromJson: ListCharactersModel.fromJson);
  }
}
