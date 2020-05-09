
import 'package:prototype/models/task.dart';

class Favo{
  List<Task> items;

  Favo(this.items);
   Favo.copy(Favo from) : this([...from.items]);
}