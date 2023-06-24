import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final String _keyId = 'id';
  final String _keyFirstName = 'firstname';
  final String _keyLastName = 'lastname';
  final String _keyGender = 'gender';
  final String _keyEmail = 'email';

  Future<void> setFirstName(String firstName) async {
    await _storage.write(key: _keyFirstName, value: firstName);
  }

  Future<String?> getFirstName() async {
    return await _storage.read(key: _keyFirstName);
  }

  Future<void> setLastName(String lastName) async {
    await _storage.write(key: _keyLastName, value: lastName);
  }

  Future<String?> getLastName() async {
    return await _storage.read(key: _keyLastName);
  }

  Future<void> setId(String id) async {
    await _storage.write(key: _keyId, value: id);
  }

  Future<String?> getId() async {
    return await _storage.read(key: _keyId);
  }

  Future<void> setGender(String gender) async {
    await _storage.write(key: _keyGender, value: gender);
  }

  Future<String?> getGender() async {
    return await _storage.read(key: _keyGender);
  }

  Future<void> setEmail(String email) async {
    await _storage.write(key: _keyEmail, value: email);
  }

  Future<String?> getEmail() async {
    return await _storage.read(key: _keyEmail);
  }

  Future<void> logout() async {
    await setEmail('');
    await setFirstName('');
    await setGender('');
    await setId('');
    await setLastName('');
  }
}
