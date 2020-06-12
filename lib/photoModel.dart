class Photo {
  final description;
  final Urls image;
  final User user;

  Photo({this.description, this.image, this.user});
  factory Photo.fromJSON(Map<String, dynamic> json) {
    return Photo(
      description: json['description'],
      image: Urls.fromJSON(json['urls']),
      user: User.fromJSON(json['user']),
    );
  }
}

class Urls {
  final small;
  final full;

  Urls({this.small, this.full});
  factory Urls.fromJSON(Map<String, dynamic> json) {
    return Urls(
      small: json['thumb'],
      full: json['full'],
    );
  }
}

class User {
  final name;
  final ProfileImage profileImage;

  User({this.name, this.profileImage});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      profileImage: ProfileImage.fromJSON(json['profile_image']),
    );
  }
}

class ProfileImage {
  final smallImage;

  ProfileImage({this.smallImage});

  factory ProfileImage.fromJSON(Map<String, dynamic> json) {
    return ProfileImage(
      smallImage: json['medium'],
    );
  }
}
