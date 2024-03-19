import 'package:rick_and_morty_app/share/base/exception/base_exception.dart';

class UnprocessableException extends BaseException {
  late String error;
  late String message;

  UnprocessableException(Map cause) : super(cause: cause.toString()) {
    error = cause['error'] ?? '';
    message = cause['message'] ?? '';
  }

  @override
  String toString() => "Unprocessable Exception: $cause";
}
