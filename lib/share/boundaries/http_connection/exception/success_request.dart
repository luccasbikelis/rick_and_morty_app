import 'package:rick_and_morty_app/share/base/exception/base_exception.dart';

class SuccessRequest extends BaseException {
  late String message;
  SuccessRequest(Map cause) : super(cause: cause.toString()) {
    message = cause['message'] ?? '';
  }
}
