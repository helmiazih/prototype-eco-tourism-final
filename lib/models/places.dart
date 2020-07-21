class Place {
  String id;
  String place;
  String image;
  String state;
  String status;
  bool favorite;

  Place({
    this.id,
    this.place,
    this.image,
    this.state,
    this.status,
    this.favorite,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return new Place(
      id: json['id'],
      place: json['place'],
      image: json['image'],
      state: json['state'],
      status: json['status'],
      favorite: json['favorite'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'place': place,
        'image': image,
        'state': state,
        'status': status,
        'favorite': favorite
      };
}
