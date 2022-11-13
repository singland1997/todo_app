import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class Todo {
  int id;
  String title;
  String description;
  bool isDone;

  Todo({
    this.id = 0,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
