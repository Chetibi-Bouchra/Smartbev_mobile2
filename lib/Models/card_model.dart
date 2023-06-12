class InfoCard {
  final String number;
  final String expMonth;
  final String expYear;
  final String cvc;

  InfoCard({
    required this.number,
    required this.expMonth,
    required this.expYear,
    required this.cvc,
  });
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
