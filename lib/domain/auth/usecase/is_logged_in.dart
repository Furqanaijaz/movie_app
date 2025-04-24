import 'package:netfilx/common/usecase/usecase.dart';
import 'package:netfilx/domain/auth/repository/repository.dart';
import 'package:netfilx/service_locator.dart';

class IsLoggedInUseCase extends Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<Repository>().isLoggedIn();
  }
}
