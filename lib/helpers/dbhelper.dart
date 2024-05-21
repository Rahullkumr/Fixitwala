import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/customer.dart';
import '../models/service_provider.dart';

class DatabaseHelper {
  static const _databaseName = "fixitwala.db";
  static const _databaseVersion = 1;
  static const String _customerTable = "customers";
  static const _serviceProviderTable = "service_providers";

  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  // Getter for the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // Create tables
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_customerTable (
        cId INTEGER PRIMARY KEY AUTOINCREMENT,
        cName TEXT NOT NULL,
        address TEXT,
        emailId TEXT NOT NULL UNIQUE,
        mobileNo TEXT NOT NULL UNIQUE,
        pwd TEXT NOT NULL,
        verificationStatus INTEGER NOT NULL
      )''');

    await db.execute('''
      CREATE TABLE $_serviceProviderTable (
        spId INTEGER PRIMARY KEY AUTOINCREMENT,
        spName TEXT NOT NULL,
        address TEXT,
        emailId TEXT NOT NULL UNIQUE,
        mobileNo TEXT NOT NULL UNIQUE,
        category TEXT NOT NULL,
        description TEXT,
        availability TEXT,
        pwd TEXT NOT NULL,
        verificationStatus INTEGER NOT NULL
      )''');
  }

  // Handle database upgrades
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle database upgrade if schema changes
  }

  // Close the database
  Future<void> close() async {
    final db = await database;
    db.close();
  }

  // Customer methods
  Future<void> insertCustomer(Customer customer) async {
    try {
      final db = await instance.database;
      await db.insert(_customerTable, customer.toMap());
    } catch (e) {
      print('Error inserting customer: $e');
    }
  }

  Future<List<Customer>> readAllCustomers() async {
    final db = await instance.database;
    final result = await db.query(_customerTable);

    return result.map((json) => Customer.fromMap(json)).toList();
  }

  Future<Customer?> getCustomer(int cId) async {
    try {
      final db = await instance.database;
      final maps =
          await db.query(_customerTable, where: 'cId = ?', whereArgs: [cId]);
      if (maps.isNotEmpty) {
        return Customer.fromMap(maps.first);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching customer: $e');
      return null;
    }
  }

  Future<Customer?> getCustomerByEmail(String emailId) async {
    try {
      final db = await instance.database;
      final maps = await db
          .query(_customerTable, where: 'emailId = ?', whereArgs: [emailId]);
      if (maps.isNotEmpty) {
        return Customer.fromMap(maps.first);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching customer by email: $e');
      return null;
    }
  }

  Future<int> updateCustomer(Customer customer) async {
    try {
      final db = await instance.database;
      return await db.update(_customerTable, customer.toMap(),
          where: 'cId = ?', whereArgs: [customer.cId]);
    } catch (e) {
      print('Error updating customer: $e');
      return -1;
    }
  }

  Future<int> deleteCustomer(int cId) async {
    try {
      final db = await instance.database;

      return await db.delete(_customerTable, where: 'cId = ?', whereArgs: [cId]);
    } catch (e) {
      print('Error deleting customer: $e');
      return -1;
    }
  }

  Future<Customer?> authenticateCustomer(String email, String password) async {
    try {
      final db = await instance.database;
      final maps = await db.query(
        _customerTable,
        where: 'emailId = ? AND pwd = ?',
        whereArgs: [email, password],
      );
      if (maps.isNotEmpty) {
        return Customer.fromMap(maps.first);
      } else {
        return null;
      }
    } catch (e) {
      print('Error authenticating customer: $e');
      return null;
    }
  }

  // Service provider methods
  Future<void> insertServiceProvider(ServiceProvider sp) async {
    try {
      final db = await instance.database;
      await db.insert(_serviceProviderTable, sp.toMap());
    } catch (e) {
      print('Error inserting service provider: $e');
    }
  }

  Future<ServiceProvider?> getServiceProvider(int spId) async {
    try {
      final db = await instance.database;
      final maps = await db
          .query(_serviceProviderTable, where: 'spId = ?', whereArgs: [spId]);
      if (maps.isNotEmpty) {
        return ServiceProvider.fromMap(maps.first);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching service provider: $e');
      return null;
    }
  }

  Future<ServiceProvider?> getServiceProviderByEmail(String emailId) async {
    try {
      final db = await instance.database;
      final maps = await db.query(_serviceProviderTable,
          where: 'emailId = ?', whereArgs: [emailId]);
      if (maps.isNotEmpty) {
        return ServiceProvider.fromMap(maps.first);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching service provider by email: $e');
      return null;
    }
  }

  Future<void> updateServiceProvider(ServiceProvider sp) async {
    try {
      final db = await instance.database;
      await db.update(_serviceProviderTable, sp.toMap(),
          where: 'spId = ?', whereArgs: [sp.spId]);
    } catch (e) {
      print('Error updating service provider: $e');
    }
  }

  Future<void> deleteServiceProvider(int spId) async {
    try {
      final db = await instance.database;
      await db
          .delete(_serviceProviderTable, where: 'spId = ?', whereArgs: [spId]);
    } catch (e) {
      print('Error deleting service provider: $e');
    }
  }
}
