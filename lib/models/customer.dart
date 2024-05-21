class Customer {
  final int? cId;
  final String cName;
  final String address;
  final String emailId;
  final String mobileNo;
  final String pwd;
  final int verificationStatus;

  Customer(
      {this.cId,
      required this.cName,
      required this.address,
      required this.emailId,
      required this.mobileNo,
      required this.pwd,
      required this.verificationStatus});

  Map<String, dynamic> toMap() {
    return {
      'cId': cId,
      'cName': cName,
      'address': address,
      'emailId': emailId,
      'mobileNo': mobileNo,
      'pwd': pwd,
      'verificationStatus': verificationStatus,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      cId: map['cId'],
      cName: map['cName'],
      address: map['address'],
      emailId: map['emailId'],
      mobileNo: map['mobileNo'],
      pwd: map['pwd'],
      verificationStatus: map['verificationStatus'],
    );
  }
}
