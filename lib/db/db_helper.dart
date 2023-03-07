import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:suit_up/models/cart_model.dart';

class DatabaseHelper {
//
  DatabaseHelper._();

  static final DatabaseHelper db = DatabaseHelper._();
  //
  static Database? _database;

  //
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
      join(await getDatabasesPath(), 'suit_up_cart_store.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute("""
          CREATE TABLE cart(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            imageUrl TEXT NOT NULL,
            price DOUBLE NOT NULL,
            category TEXT,
            size CHAR(3),
            color CHAR(15),
            quantity INTEGER NOT NULL)
        """);
      },
    );
  }

  //
  Future<CartProduct> insert(CartProduct cart) async {
    var dbClient = await database;
    await dbClient!.insert('cart', cart.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return cart;
  }

  // getting all the items in the list from the database
  Future<List<CartProduct>> getCartList() async {
    var dbClient = await database;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('cart');
    return queryResult.map((result) => CartProduct.fromMap(result)).toList();
  }

  Future<int> updateQuantity(CartProduct cart) async {
    var dbClient = await database;
    return await dbClient!
        .update('cart', cart.toMap(), where: "id = ?", whereArgs: [cart.id]);
  }

// deleting an item from the cart screen
  Future<int> deleteCartItem(int id) async {
    var dbClient = await database;
    return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }
}
