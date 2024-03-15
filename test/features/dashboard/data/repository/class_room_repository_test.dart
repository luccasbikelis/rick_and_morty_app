import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/features/dashboard/data/datasource/class_room_datasource.dart';
import 'package:rick_and_morty_app/features/dashboard/data/repository/class_room_repository_impl.dart';
import 'package:rick_and_morty_app/features/dashboard/domain/entities/list_class_room_entity.dart';

void main() {
  late ClassRoomDataSource dataSource;
  late ClassRoomRepositoryImpl repository;

  setUp(() {
    dataSource = ClassRoomDataSource();
    repository = ClassRoomRepositoryImpl(dataSource);
  });

  test('should return a ListClassRoomEntity', () async {
    final result = await repository.call();

    expect(result, isA<ListClassRoomEntity>());
  });
}
