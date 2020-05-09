class Task {
  String place;
  String image;
  String state;
  String status;
  bool favorite;

  Task({this.place,this.state,this.image,this.status,this.favorite=false});
  Task.copy(Task from) : this(place: from.place,state:from.state, image: from.image,status: from.status, favorite: from.favorite);

}
