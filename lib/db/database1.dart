import 'package:flutter/material.dart';
import 'package:myapp/db/doctor.dart';

class Database {
  static List<Doctor> doctors = [
    Doctor('Cardiovascular', Icons.favorite),
    Doctor('Ginecologista', Icons.female),
    Doctor('Pediátrico', Icons.child_care),
    Doctor('Andrologista', Icons.male),
    Doctor('Oncologista', Icons.local_hospital),
    Doctor('Endocrinologista', Icons.healing),
    Doctor('Gastroenterologista', Icons.local_dining),
    Doctor('Nutricionista', Icons.medical_information_rounded)
  ];
}