import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/lang_repository.dart';
import '../datasources/lang_local_data.dart';

class LangRepositoryImp implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImp({required this.langLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      return Right(await langLocalDataSource.changeLang(langCode: langCode));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSaveLang();
      return Right(langCode);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
