class StudentAddress {
  final int addressId;
  final String addressType;
  final String houseNumber;
  final String area;
  final String city;
  final String state;
  final String country;
  final String zipCode;
  final String landMark;

  StudentAddress({
    required this.addressId,
    required this.addressType,
    required this.houseNumber,
    required this.area,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.landMark,
  });

  factory StudentAddress.fromJson(Map<String, dynamic> json) => StudentAddress(
    addressId: json['addressId'],
    addressType: json['addressType'],
    houseNumber: json['houseNumber'],
    area: json['area'],
    city: json['city'],
    state: json['state'],
    country: json['country'],
    zipCode: json['zipCode'],
    landMark: json['landMark'],
  );
}