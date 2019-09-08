class ClientEntity {
  String _clientID;
  String _email;
  String _phone;
  String _name;
  String _surname;

  ClientEntity(this._clientID, this._email, this._phone, this._name, this._surname);

  String get getClientID => _clientID;
  String get getEmail => _email;
  String get getPhone => _phone;
  String get getName => _name;
  String get getSurname => _surname;
}
