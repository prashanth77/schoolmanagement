class Student {
  PersonalInfo personalInfo;
  List<Address> addresses;
  List<Guardian> guardians;
  List<Academic> academics;

  Student({
    required this.personalInfo,
    required this.addresses,
    required this.guardians,
    required this.academics,
  });

  Map<String, dynamic> toJson() => {
    'personalInfo': personalInfo.toJson(),
    'addresses': addresses.map((a) => a.toJson()).toList(),
    'parentGuardians': guardians.map((g) => g.toJson()).toList(),
    'academics': academics.map((ac) => ac.toJson()).toList(),
  };
}

class PersonalInfo {
  String firstName;
  String lastName;
  String gender;
  int age;
  String dateOfBirth;
  String emailId;
  int phoneNumber;

  PersonalInfo({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.age,
    required this.dateOfBirth,
    required this.emailId,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'gender': gender,
    'age': age,
    'dateOfBirth': dateOfBirth,
    'emailId': emailId,
    'phoneNumber': phoneNumber,
  };
}

class Address {
  String addressType;
  String houseNumber;
  String city;
  String state;
  String country;

  Address({
    required this.addressType,
    required this.houseNumber,
    required this.city,
    required this.state,
    required this.country,
  });

  Map<String, dynamic> toJson() => {
    'addressType': addressType,
    'houseNumber': houseNumber,
    'city': city,
    'state': state,
    'country': country,
  };
}

class Guardian {
  String name;
  String relationType;
  String phoneNumber;

  Guardian({
    required this.name,
    required this.relationType,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'relationType': relationType,
    'phoneNumber': phoneNumber,
  };
}

class Academic {
  String grade;
  String section;
  String rollNumber;

  Academic({
    required this.grade,
    required this.section,
    required this.rollNumber,
  });

  Map<String, dynamic> toJson() => {
    'grade': grade,
    'section': section,
    'rollNumber': rollNumber,
  };
}
