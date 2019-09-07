import 'package:market/domain/entity/client_entity.dart';
import 'package:market/domain/repository/client_repository.dart';

class GetCurrentUserUsecase {
  ClientRepository _clientRepository;

  GetCurrentUserUsecase(this._clientRepository);

  Future<ClientEntity> execute() async {
    return await _clientRepository.getCurrentClient();
  }
}
