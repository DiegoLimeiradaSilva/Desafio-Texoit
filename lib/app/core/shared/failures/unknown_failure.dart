import 'package:desafiotecnico/app/core/shared/failures/app_failure.dart';

class UnknownFailure extends AppFailure {
  UnknownFailure(
    super.message, {
    required this.innerException,
    required this.innerStackTrace,
    super.stackTrace,
  });

  final Object innerException;
  final StackTrace innerStackTrace;
}
