import 'package:bloc_concept/data/sqflite/database.dart';
import 'package:bloc_concept/data/models/Guest.dart';
import 'dart:convert';
var _dbHelper = DatabaseHelper.instance;

Future insertGuest(Guest guest, Address address) async {
  var addressString = jsonEncode(address.toJson());
  //var addressId = await insertAddress(address);
  Map<String, dynamic> row = {
    Guest.columnFirstName: guest.firstName,
    Guest.columnLastName: guest.lastName,
    Guest.columnEmail: guest.email,
    Guest.columnPhone: guest.phone,
    Guest.columnAddresses: addressString,
    Guest.columnBirthDate: guest.birthDate,
    Guest.columnAnniversary: guest.anniversary,
    Guest.columnCustomerNotes: guest.customerNotes,
  };
  final id = await _dbHelper.insert(row, Guest.table);
  print('inserted row id: $id');
}

Future<List<Guest>> queryGuests() async {
  final allRows = await _dbHelper.queryAllRows(Guest.table);
  print('query all rows:');
  List<Guest> guests=[];
  allRows.forEach((row)  {
    guests.add(Guest.fromJson(row));
  });
  return guests;
}

void updateGuest(Guest guest) async {
  Map<String, dynamic> row = {
    Guest.columnId: guest.id,
    Guest.columnFirstName: guest.firstName,
    Guest.columnLastName: guest.lastName,
    Guest.columnEmail: guest.email,
    Guest.columnPhone: guest.phone,
    Guest.columnAddresses: 0
  };
  final rowsAffected = await _dbHelper.update(row, Guest.table, Guest.columnId);
  print('updated $rowsAffected row(s)');
}

void deleteGuest(int id) async {
  final rowsDeleted = await _dbHelper.delete(id, Guest.table, Guest.columnId);
  print('deleted $rowsDeleted row(s): row $id');
}
