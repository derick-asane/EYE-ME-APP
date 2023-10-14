import 'dart:convert';
class UserId {

   UserId({
     required this.id
});
   int id;

   factory UserId.fromJson(Map<String, dynamic> json) => UserId(
       id: json["id"]
   );
}