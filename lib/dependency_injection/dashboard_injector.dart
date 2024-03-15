import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/features/dashboard/data/datasource/class_room_datasource.dart';
import 'package:rick_and_morty_app/features/dashboard/data/repository/class_room_repository_impl.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/repository/class_room_repository.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/usecase/class_room_usecase.dart';
import 'package:rick_and_morty_app/presenter/dashboard/controllers/get_class_room_controller.dart';

class DashboardInjector {
  final getIT = GetIt.I;
  call() {
    GetIt.I.registerFactory<ClassRoomDataSource>(() => ClassRoomDataSource());

    GetIt.I.registerFactory<ClassRoomRepository>(
      () => ClassRoomRepositoryImpl(GetIt.I<ClassRoomDataSource>()),
    );

    GetIt.I.registerFactory<ClassRoomUseCase>(() => ClassRoomUseCaseImpl(
          GetIt.I<ClassRoomRepository>(),
        ));

    GetIt.I.registerLazySingleton<GetClassRoomController>(() => GetClassRoomController(
          getIT<ClassRoomUseCase>(),
        ));
  }
}
