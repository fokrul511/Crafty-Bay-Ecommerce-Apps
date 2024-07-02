class CartModel {
  final int product_id;
  final String color;
  final String size;
  final int quantity;

  CartModel({
    required this.product_id,
    required this.color,
    required this.size,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      "product_id": product_id,
      "color": color,
      "size": size,
      "qty": quantity,
    };
  }
}
