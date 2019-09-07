import 'package:market/domain/entity/client_entity.dart';
import 'package:market/domain/repository/client_repository.dart';

class GetCurrentClientInfoUsecase {
  ClientRepository _clientRepository;

  GetCurrentClientInfoUsecase(this._clientRepository);

  Future<ClientEntity> execute() async {
    return await _clientRepository
        .getClientInfoByID(await _clientRepository.getCurrentClientID());
  }
}
