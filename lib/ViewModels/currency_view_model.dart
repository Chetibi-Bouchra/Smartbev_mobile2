import 'dart:convert';
import 'package:flutter/material.dart';
import '../Models/currency_model.dart';
import '../Services/currencies_service.dart';

class CurrencyViewModel extends ChangeNotifier {
  Currency? _currency;

  Future<void> getCurrencies() async {
    _currency = await CurrenciesAPI().fetchCurrencies();
    notifyListeners();
  }

  Future<Currency> transformQRData(String qrData) async {
    try {
      final decodedData = jsonDecode(qrData);
      Currency currency = Currency.fromJson(decodedData);
      return currency;
    } catch (e) {
      print(e);
    }
    throw Exception('Failed to transform data');
  }

  Future<String> convertCurrency(
      String oldCurrency, String newCurrency, String amount) async {
    try {
      String newPrice = await CurrenciesAPI().convertCurrency(oldCurrency, newCurrency, amount);
      
      return newPrice;
    } catch (e) {
      print(e);
    }
    throw Exception('Failed to transform data');
  }

  Currency? get currency => _currency;

  void setCurrency(Currency? value) {
    _currency = value;
  }
}
