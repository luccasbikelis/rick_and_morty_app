import 'package:rick_and_morty_app/share/base/exception/base_exception.dart';

class BadRequestFailException extends BaseException {
  late String message;
  BadRequestFailException(Map cause) : super(cause: cause.toString()) {
    message = cause['message'] ?? '';
  }
}
