import 'package:rick_and_morty_app/share/base/exception/base_exception.dart';


class NotFoundException extends BaseException {
  late String message;
  NotFoundException(Map cause) : super(cause: cause.toString()) {
    message = cause['message'] ?? '';
  }

  @override
  String toString() => "NotFound Exception: $cause";
}
