import 'package:desafiotecnico/app/core/shared/failures/app_failure.dart';

class NonAuthoritativeFailure extends AppFailure {
  NonAuthoritativeFailure(super.message, {super.stackTrace});
}
