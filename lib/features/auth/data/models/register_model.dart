import '../../../../constants.dart';

class UserInfoModel {
   String? email, password;
   String? name, whatsappNumber, accountKind;
   String? notificationToken;

   UserInfoModel({
    this.email,
    this.password,
    this.name,
    this.whatsappNumber,
    this.accountKind,
    this.notificationToken,
  });

  toJson(){
    return {
      kEmail : email ,
      kPassword : password ,
      kName : name ,
      kWhatsAppNumber: whatsappNumber ,
      kAccountKind : accountKind,
      kNotificationToken : notificationToken,
    };
  }
  factory UserInfoModel.fromJson(json){
    return UserInfoModel(
      email: json[kEmail],
      password: json[kPassword],
      name: json[kName],
      whatsappNumber: json[kWhatsAppNumber],
      accountKind: json[kAccountKind],  
      notificationToken: json[kNotificationToken],
    );
  }
}
