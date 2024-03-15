
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_class_room_entity.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/repository/class_room_repository.dart';

abstract class ClassRoomUseCase {
  Future<ListClassRoomEntity> call();
}

class ClassRoomUseCaseImpl implements ClassRoomUseCase {
  final ClassRoomRepository repository;

  ClassRoomUseCaseImpl(this.repository);

  @override
  Future<ListClassRoomEntity> call() async {
    return await repository();
  }
}