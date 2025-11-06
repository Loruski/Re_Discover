class Position {
  final int id ;
  final double latitude;
  final double longitude;

  Position({required this.id, required this.latitude, required this.longitude});

  Position.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        latitude = json['latitude'] as double,
        longitude = json['longitude'] as double;

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
  };
}