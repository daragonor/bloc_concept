import 'package:bloc_concept/data/sqflite/database.dart';
import 'package:bloc_concept/data/models/Address.dart';

var _dbHelper = DatabaseHelper.instance;

Future<int> insertAddress(Address address) async {
  // row to insert
  Map<String, dynamic> row = {
    Address.columnAddress: address.address,
    Address.columnAddressLine2: address.addressLine2,
    Address.columnCity: address.city,
    Address.columnPostalCode: address.postalCode,
    Address.columnState: address.state,
  };
  final id = await _dbHelper.insert(row, Address.table);
  print('inserted row id: $id');
  return id;
}

Future<List<Address>> queryAddresses() async {
  final allRows = await _dbHelper.queryAllRows(Address.table);
  print('query all rows:');

  List<Address> addresses=[];
  allRows.forEach((row)  {
    addresses.add(Address.fromRow(row));
  });
  return addresses;
}

Future<Address> getAddress({int by}) async {
  //final row = await _dbHelper.getById(by, Address.table, Address.columnId);
  final allRows = await _dbHelper.queryAllRows(Address.table);
  var address = Address();
  allRows.forEach((row) => {
        if (row[Address.columnId] == by) {address = Address.fromRow(row)}
      });

  return address;
}

void updateAddresses(Address address) async {
  Map<String, dynamic> row = {
    Address.columnId: address.id,
    Address.columnAddress: address.address,
    Address.columnAddressLine2: address,
    Address.columnCity: address.city,
    Address.columnPostalCode: address,
    Address.columnState: address.state,
  };
  final rowsAffected =
      await _dbHelper.update(row, Address.table, Address.columnId);
  print('updated $rowsAffected row(s)');
}

void deleteAddresses(int id) async {
  final rowsDeleted =
      await _dbHelper.delete(id, Address.table, Address.columnId);
  print('deleted $rowsDeleted row(s): row $id');
}
