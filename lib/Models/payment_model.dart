class Payment {
  final double amount;
  final String currency;
  final String paymentMethodId;
  final String customerId;
  final String sellerAccountId;
  final String orderId;

  Payment(
      {required this.amount,
      required this.currency,
      required this.paymentMethodId,
      required this.customerId,
      required this.sellerAccountId,
      required this.orderId});
  /*factory Payment.fromJSON(Map<String, dynamic> jsonData) {
  
    return Payment(
        id: "",
        title: jsonData['strDrink'],
        imageURL: jsonData['strDrinkThumb'],
        sucre: "",
        prix: jsonData['idDrink'],
        size: "big");
  }*/
}
