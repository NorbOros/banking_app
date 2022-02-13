class Partner {
  final String _id;
  final String _name;
  final String _accountNr;
  final String _avatar;

  Partner(
      {required final String id,
      required final String name,
      required final String accountNr,
      required final String avatar})
      : _id = id,
        _name = name,
        _accountNr = accountNr,
        _avatar = avatar;

  String get id => _id;
  String get name => _name;
  String get accountNr => _accountNr;
  String get avatar => _avatar;
}
