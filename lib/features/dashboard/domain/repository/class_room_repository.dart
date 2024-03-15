
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_class_room_entity.dart';

abstract class ClassRoomRepository {
  Future<ListClassRoomEntity> call();
}
