class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class Cart {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addToCart(Product product) {
    _items.add(product);
  }
}

var cart = Cart(); 
