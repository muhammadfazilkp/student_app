class StudentModel {
  final int? id;
  final String name;
  final String rollnumber;
  final String email;
  
  StudentModel(
      {this.id,
      required this.name,
      required this.rollnumber,
      required this.email,
     });


     Map<String,dynamic>toMap(){
      Map<String,dynamic> data={
        "id":id,
        "name":name,
        "rollnumber":rollnumber,
        "email":email

      };
      return data;
     }
}