#Project dart lang of Student Manipulation 


```student_manager/
│
├── bin/
│   └── main.dart
│
├── lib/
│   ├── models/
│   │   └── student.dart
│   │
│   ├── services/
│   │   └── student_manager.dart
│   │
│   └── utils/
│       └── file_helper.dart   
│
├── data/
│   └── students.json
│
└── pubspec.yaml



# How to dart create project of structure

```dart create your name project like that 


-bin/main.dart                  → CLI program (menu, user interaction)

-lib/models/student.dart        → Student object (class + toJson/fromJson)

-lib/services/student_manager.dart → CRUD logic + file operations

-lib/utils/file_helper.dart     → File creation & loading helper

-data/students.json             → Stored student database (JSON)
