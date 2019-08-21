import 'dart:convert';

class Address {
  static final table = 'address';
  static final columnAddress = "address_address";
  static final columnAddressLine2 = "address_address_line_2";
  static final columnCity = "address_city";
  static final columnState = "address_state";
  static final columnPostalCode = "address_postal_code";
  static List<Address> fromJsonList(List<dynamic> jsonList) {
    List<Address> addresses = [];
    jsonList.forEach((json) {
      addresses.add(Address.fromJson(json));
    });
    return addresses;
  }

  static String toJsonList(List<Address> addresses) {
    List<String> addressesList = [];
    addresses.forEach((address) {
      addressesList.add(jsonEncode(address));
    });
    return jsonEncode(addressesList);
  }

  Address.fromJson(Map<String, dynamic> json)
      : address = json[columnAddress],
        addressLine2 = json[columnAddressLine2],
        city = json[columnCity],
        state = json[columnState],
        postalCode = json[columnPostalCode];

  Map<String, dynamic> toJson() => {
        columnAddress: address,
        columnAddressLine2: addressLine2,
        columnCity: city,
        columnState: state,
        columnPostalCode: postalCode
      };
  String rowPresentation() => "$address $addressLine2 $city $state $postalCode";
  String tilePresentation() =>
      "$address $addressLine2 $city, $state $postalCode";

  String address;
  String addressLine2;
  String city;
  String state;
  String postalCode;
  Address(
      [this.address = "",
      this.addressLine2 = "",
      this.city = "",
      this.state = "",
      this.postalCode = ""]);
}
