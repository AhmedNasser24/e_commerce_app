// import 'package:flutter/material.dart';

// import '../../../../core/utils/notification_service.dart';

// class NotificationView extends StatelessWidget {
//   const NotificationView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body:  Center(
//         child : Column(
//           children : [
//             TextButton(onPressed: (){
//                 NotificationService().sendMessageUsingToken(accessToken: "accessToken", title: "title", body: "body" , token: "token"); 
//               }, child: const Text("send message")),
            
              
//               TextButton(onPressed: (){
//                 NotificationService().sendMessageUsingTopic( title: "title", body: "body" , data : {}); 
//               }, child: const Text("send message with topic")),
              
//               TextButton(onPressed: (){
//                 NotificationService().unsubscribeFromTopic(); 
//               }, child: const Text("unsubscribe from topic")),
              
//               TextButton(onPressed: (){
//                 NotificationService().subscribeToTopic(); 
//               }, child: const Text("subscribe to topic")),
//           ]
//         ) ,
//       ),
//       appBar: AppBar(
//         title : const Text("Notifications") ,
//         centerTitle: true,
//       ),
//     );
//   }
// }