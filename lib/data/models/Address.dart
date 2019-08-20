class Address {
  static final table = 'address';
  static final columnId = "address_id";
  static final columnAddress = "address_address";
  static final columnAddressLine2 = "address_address_line_2";
  static final columnCity = "address_city";
  static final columnState = "address_state";
  static final columnPostalCode = "address_postal_code";
  static Address fromRow(Map row) {
    return Address(
      row[columnId],
      row[columnAddress],
      row[columnAddressLine2],
      row[columnCity],
      row[columnState],
      row[columnPostalCode]
    );
  }
  static final String dbCreate= '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnAddress TEXT NOT NULL,
            $columnAddressLine2 TEXT NOT NULL,
            $columnCity TEXT NOT NULL,
            $columnState TEXT NOT NULL,
            $columnPostalCode INTEGER NOT NULL
          )
          ''';
  int id;
  String address;
  String addressLine2;
  String city;
  String state;
  String postalCode;
  Address(
      [this.id,
      this.address="",
      this.addressLine2="",
      this.city="",
      this.state="",
      this.postalCode=""]);
}
