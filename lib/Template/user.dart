class User {
  String id;
  String userName;
  String userAvatar;
  List<String> listNameAndAvatar = [];

  User({
    this.id,
    this.userName,
    this.userAvatar,
    this.listNameAndAvatar,
  });

  static Map<String, dynamic> toJson(User user) {
    return {
      'title':
          user.listNameAndAvatar = ['${user.userName}', '${user.userAvatar}'],
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    var listNameAndAvatar = json['title'].cast<String>();
    String _userName = listNameAndAvatar.elementAt(0);
    String _userAvatar = listNameAndAvatar.elementAt(1);
    return User(
      id: json['id'],
      userName: _userName,
      userAvatar: _userAvatar,
    );
  }
}
