import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/features/dashboard/data/datasource/character_datasource.dart';
import 'package:rick_and_morty_app/features/dashboard/data/repository/character_repository_impl.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/repository/character_repository.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/usecase/character_usecase.dart';
import 'package:rick_and_morty_app/presenter/dashboard/controllers/list_characters_controller.dart';
import 'package:rick_and_morty_app/share/boundaries/http_connection/http_facade.dart';

class DashboardInjector {
  final getIT = GetIt.I;
  call() {
    GetIt.I.registerFactory<CharacterDataSource>(() => CharacterDataSource(GetIt.I<HttpFacade>(),));

    GetIt.I.registerFactory<CharacterRepository>(
      () => CharacterRepositoryImpl(GetIt.I<CharacterDataSource>()),
    );

    GetIt.I.registerFactory<CharacterUseCase>(() => CharacterUseCaseImpl(
          GetIt.I<CharacterRepository>(),
        ));

    GetIt.I.registerLazySingleton<ListCharactersController>(() => ListCharactersController(
          getIT<CharacterUseCase>(),
        ));
  }
}
