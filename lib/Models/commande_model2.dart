class Commande {
  final String id;
  final String title;
  final String imageURL;
  final String prix;
  final String size;
  final String sucre;

  Commande(
      {required this.id,
      required this.sucre,
      required this.title,
      required this.imageURL,
      required this.prix,
      required this.size});
  factory Commande.fromJSON(Map<String, dynamic> jsonData) {
    /*return Commande(
        id: jsonData['id_cmd'],
        title: "test",
        imageURL: "test",
        sucre: jsonData['quantite_sucre'],
        prix: jsonData['prix_cmd'],
        size: jsonData['taille_goblet']);*/
        return Commande(
        id: "",
        title:jsonData['strDrink'],
        imageURL: jsonData['strDrinkThumb'],
        sucre: "",
        prix: jsonData['idDrink'],
        size: "big");
  }
}
