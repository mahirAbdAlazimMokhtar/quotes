import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/lang_repository.dart';

class GetChangeLocaleUseCase implements UseCase<bool, String> {
  final LangRepository langRepository;

  GetChangeLocaleUseCase({required this.langRepository});
  @override
  Future<Either<Failure, bool>> call(String params) async => await langRepository.changeLang(langCode: params);
}
