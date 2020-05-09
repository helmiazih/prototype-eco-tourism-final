import 'package:prototype/models/task.dart';

class Todo{
  String title;
  String image;
  List<Task> items;

  Todo(this.title,this.image,this.items);
  Todo.copy(Todo from) : this(from.title,from.image, [...from.items]);
}