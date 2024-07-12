
class Product {
  final String name;
  final num price;
  final String description;
  final String imagePath;
  int quantity;
  double totalPrice;
  final String category;

  Product(
      {required this.name,
      required this.price,
      required this.description,
      required this.imagePath,
      this.quantity = 0,
      this.totalPrice = 0,
     required this.category});

  //incremento quantidade
  void incrementQuantity() {
    quantity++;
    totalPrice += price;
  }

  // decremento de quantidade
  void decreamentQuantity() {
    quantity--;
    totalPrice -= price;
  }

  //quantidade inicial
  void initialQuantity() {
    quantity = 0;
    totalPrice = 0;
  }
}
