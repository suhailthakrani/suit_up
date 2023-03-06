import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:suit_up/models/cart_model.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();
  //
  static Database? _database;

  //Getting database
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'suit_up_cart.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute("""
          CREATE TABLE cartItems(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            imageUrl TEXT NOT NULL,
            price DOUBLE NOT NULL,
            category TEXT,
            size TEXT,
            color TEXT,
            quantity INTEGER NOT NULL)
        """);
      },
    );
  }

  //addting cart items to the cart

  Future<void> addToCart(CartProduct cartProduct) async {
    final db = await database;
    
    db!.insert('cartItems', cartProduct.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }

  //Removing cart item from the cart

  Future<void> removeFromCart(int id) async {
    final db = await database;
    db!.delete('cartItems', where: 'id = ?', whereArgs: [id]);
    notifyListeners();
  }

  

  //Getting cart items
 Future<List<CartProduct>> cartItems() async {
    final db = await database;
    var cartItems = await db!.query('cartItems');
    if (cartItems.isEmpty) {
      return [];
    } else {
      List<CartProduct> cartProducts = [];
      for (var element in cartItems) { cartProducts.add(CartProduct.fromMap(element)); }
      return cartProducts.isNotEmpty ? cartProducts: [];
    }
  }
}
