import 'package:rick_and_morty_app/features/dashboard/data/model/list_class_room_model.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_class_room_entity.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/repository/class_room_repository.dart';
import 'package:rick_and_morty_app/share/base/datasource/datasource.dart';

class ClassRoomRepositoryImpl implements ClassRoomRepository {
  final DataSource dataSource;

  ClassRoomRepositoryImpl(this.dataSource);

  @override
  Future<ListClassRoomEntity> call() async {
    return await dataSource(fromJson: (json) => ListClassRoomModel.fromJson(json as List));
  }
}
