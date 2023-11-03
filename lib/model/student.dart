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
}