import '../../../../constants.dart';

class RegisterModel {
   String? email, password;
   String? name, whatsappNumber, accountKind;

   RegisterModel({
    this.email,
    this.password,
    this.name,
    this.whatsappNumber,
    this.accountKind,
  });

  toJson(){
    return {
      kEmail : email ,
      kPassword : password ,
      kName : name ,
      kWhatsAppNumber: whatsappNumber ,
      kAccountKind : accountKind,
    };
  }
}
