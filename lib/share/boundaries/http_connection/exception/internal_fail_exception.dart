import 'package:rick_and_morty_app/share/base/exception/base_exception.dart';

class InternalFailException extends BaseException {
  late String message;
  InternalFailException(Map cause) : super(cause: cause.toString()) {
    message = cause['message'] ?? '';
  }

  @override
  String toString() => "Internal Fail Exception: $cause";
}
