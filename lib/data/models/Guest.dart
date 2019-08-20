export 'Address.dart';

import 'dart:typed_data';

class Guest {
  static final table = 'guest';
  static final columnId = "guest_id";
  static final columnFirstName = "guest_first_name";
  static final columnLastName = "guest_last_name";
  static final columnEmail = "guest_email";
  static final columnPhone = "guest_phone";
  static final columnAddresses = "guest_addresses";
  static final columnBirthDate = "guest_birth_date";
  static final columnAnniversary = "guest_anniversary";
  static final columnCustomerNotes = "guest_customer_notes";
  static Guest mapRow(Map row) {
    return Guest(
      row[columnId],
      row[columnFirstName],
      row[columnLastName],
      row[columnEmail],
      row[columnPhone],
      row[columnAddresses],
      row[columnBirthDate],
      row[columnAnniversary],
      row[columnCustomerNotes],
    );
  }

  static final String dbCreate = '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnFirstName TEXT NOT NULL,
            $columnLastName TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnPhone TEXT NOT NULL,
            $columnAddresses BLOB NOT NULL,
            $columnBirthDate TEXT NOT NULL,
            $columnAnniversary TEXT NOT NULL,
            $columnCustomerNotes TEXT NOT NULL
          )
          ''';
  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  Uint8List addresses;
  String birthDate;
  String anniversary;
  String customerNotes;
  Guest(
      [this.id,
      this.firstName="",
      this.lastName="",
      this.email="",
      this.phone="",
      this.addresses,
      this.birthDate="",
      this.anniversary="",
      this.customerNotes=""]);
}
