class AddressModel {
  final String name;
  final String emailId;
  final String number;
  final String address;
  final String pincode;
  final String city;
  final String state;
  final String addressType;

  AddressModel({
    required this.name,
    required this.emailId,
    required this.number,
    required this.address,
    required this.pincode,
    required this.city,
    required this.state,
    required this.addressType,
  });

  factory AddressModel.fromJson(Map address) {
    return AddressModel(
      name: address['name'],
      emailId: address['emailId'],
      number: address['number'],
      address: address['address'],
      pincode: address['pincode'],
      city: address['city'],
      state: address['state'],
      addressType: address['addressType'],
    );
  }

  Map<Object, Object> toJson() {
    return {
      'name': name,
      'emailId': emailId,
      'number': number,
      'address': address,
      'pincode': pincode,
      'city': city,
      'state': state,
      'addressType': addressType,
    };
  }
}
