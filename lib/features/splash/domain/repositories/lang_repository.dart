import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class LangRepository {
  Future<Either<Failure, bool>> changeLang({required String langCode});
  Future<Either<Failure, String>> getSavedLang();
}
