class Address {
  static final table = 'address';
  static final columnId = "address_id";
  static final columnAddress = "address_address";
  static final columnAddressLine2 = "address_address_line_2";
  static final columnCity = "address_city";
  static final columnState = "address_state";
  static final columnPostalCode = "address_postal_code";
  Address.fromJson(Map<String, dynamic> json)
      : id = json[columnId],
        address = json[columnAddress],
        addressLine2 = json[columnAddressLine2],
        city = json[columnCity],
        state = json[columnState],
        postalCode = json[columnPostalCode];



  Map<String, dynamic> toJson() => {
        columnId: id,
        columnAddress: address,
        columnAddressLine2: addressLine2,
        columnCity: city,
        columnState: state,
        columnPostalCode: postalCode
      };
  
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
