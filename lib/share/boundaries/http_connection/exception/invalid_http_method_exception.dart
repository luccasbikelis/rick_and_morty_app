import 'package:rick_and_morty_app/share/base/exception/base_exception.dart';

class InvalidHttpMethodException extends BaseException {
  InvalidHttpMethodException(String cause) : super(cause: cause);

  @override
  String toString() => "Invalid (enum) Http Method Exception: $cause";
}
