import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Models/payment_model.dart';
import 'package:smartbevmobile2/Views/authentication_view.dart';
import 'package:smartbevmobile2/Views/paiement_client_info_view.dart';

import '../../Services/secure_storage.dart';
import '../../ViewModels/commande_view_model.dart';
import '../../Utils/colors.dart';
import '../../ViewModels/currency_view_model.dart';
import 'filled_button.dart';

class DisplayCommande extends StatefulWidget {
  const DisplayCommande({Key? key, required this.commandeViewModel})
      : super(key: key);

  final CommandeViewModel commandeViewModel;

  @override
  _DisplayCommandeState createState() => _DisplayCommandeState();
}

class _DisplayCommandeState extends State<DisplayCommande> {
  String? _selectedCurrency;
  CurrencyViewModel currenciesViewModel = CurrencyViewModel();
  late String convertedPrice;

  final SecureStorage _secureStorage = SecureStorage();

  @override
  void initState() {
    convertedPrice = widget.commandeViewModel.commande!.prixCmd.toString();
    super.initState();
    _fetchCurrencies();
  }

  Future<void> _fetchCurrencies() async {
    try {
      await currenciesViewModel.getCurrencies();
      var currencies = currenciesViewModel.currency?.symbols.entries;

      if (currencies!.isNotEmpty) {
        setState(() {
          _selectedCurrency = "DZD";

        });
      }
    } catch (e) {
      print('Error fetching currencies: $e');
    }
  }

  Future<void> _convertPrice(
      String oldCurrency, String newCurrency, String price) async {

    CurrencyViewModel viewModel = CurrencyViewModel();
    String convertedPrice =
        await viewModel.convertCurrency(oldCurrency, newCurrency, price);
    setState(() {
      this.convertedPrice = convertedPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const Column(
            children: [
              Text(
                'Voici votre commande',
                style: TextStyle(
                  fontFamily: '',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
          Container(
            width: 300,
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://cuppa.onrender.com/${widget.commandeViewModel.commande!.imageCmd}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.commandeViewModel.commande!.name,
            style: const TextStyle(
              fontFamily: '',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 30),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Size',
                style: TextStyle(
                  fontFamily: '',
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textColor,
                ),
              ),
              Text("Small"),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontFamily: '',
                  fontSize: 33,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    convertedPrice.toString(), // Display the converted price
                    style: const TextStyle(
                      fontFamily: '',
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.buttonColor,
                    ),
                  ),
                  Flexible(
                    child: DropdownButton<String>(
                      value: _selectedCurrency,
                      items: _buildDropdownItems(),
                      onChanged: (String? newValue) {
                        if (_selectedCurrency != newValue) {
                          _convertPrice(
                              "DZD",
                              newValue!,
                              widget.commandeViewModel.commande!.prixCmd
                                  .toString());
                        }
                        setState(() {
                          _selectedCurrency = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: CustomFilledButton(
                  text: 'Confirmer',
                  onPressed: () async {
                    // Retrieve the value of a key from the secure storage
                    String? userId = await _secureStorage.getId() ?? '';


                    if (userId != '') {
                      // User is logged in, proceed with the payment flow
                      Payment payment = Payment(
                        amount: double.parse(convertedPrice),
                        currency: _selectedCurrency!,
                        paymentMethodId: "",
                        customerId: userId,
                        sellerAccountId: "acct_1Mtq1gH6MZlaUz2j",
                        orderId:
                            widget.commandeViewModel.commande!.idCmd.toString(),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaiementInfoPage(payment: payment),
                        ),
                      );
                    } else {
                      // User is not logged in, navigate to the LoginPage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthenticationPage(),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: CustomFilledButton(
                  text: 'Annuler',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    final items = <DropdownMenuItem<String>>[];
    if (_selectedCurrency != null) {
      for (final entry in currenciesViewModel.currency!.symbols.entries) {
        final currencyName = entry.key;
        items.add(
          DropdownMenuItem<String>(
            value: currencyName,
            child: Text(currencyName),
          ),
        );
      }
    }
    return items;
  }
}
