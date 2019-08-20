export 'Address.dart';

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
  Guest.fromJson(Map<String, dynamic> json)
      : id = json[columnId],
        firstName = json[columnFirstName],
        lastName = json[columnLastName],
        email = json[columnEmail],
        phone = json[columnPhone],
        addresses = json[columnAddresses],
        birthDate = json[columnBirthDate],
        anniversary = json[columnAnniversary],
        customerNotes = json[columnCustomerNotes];
  Map<String, dynamic> toJson() => {
        columnId: id,
        columnFirstName: firstName,
        columnLastName: lastName,
        columnEmail: email,
        columnPhone: phone,
        columnAddresses: addresses,
        columnBirthDate: birthDate,
        columnAnniversary: anniversary,
        columnCustomerNotes: customerNotes
      };

  static final String dbCreate = '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnFirstName TEXT NOT NULL,
            $columnLastName TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnPhone TEXT NOT NULL,
            $columnAddresses TEXT NOT NULL,
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
  String addresses;
  String birthDate;
  String anniversary;
  String customerNotes;
  Guest(
      [this.id,
      this.firstName = "",
      this.lastName = "",
      this.email = "",
      this.phone = "",
      this.addresses = "",
      this.birthDate = "",
      this.anniversary = "",
      this.customerNotes = ""]);
}
