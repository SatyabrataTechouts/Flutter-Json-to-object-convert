class UserModel {
  final int? id;
  final Name? name;
  final List<dynamic>? type;
  final Base? base;

  UserModel({
    required this.id,
    required this.name,
    required this.type,
    required this.base,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: Name.formjson(json['name']),
        type: json['type'],
        base: Base.formjson(json['base']));
  }
}

class Name {
  final String? english;
  final String? japanese;
  final String? chinese;
  final String? french;
  Name(
      {required this.chinese,
      required this.english,
      required this.french,
      required this.japanese});

  factory Name.formjson(Map<String, dynamic> json) {
    return Name(
        chinese: json['chinese'],
        english: json['english'],
        french: json['french'],
        japanese: json['japanese']);
  }
}

class Base {
  final int? HP;
  final int? Attack;
  final int? Defense;
  final int? spAttack;
  final int? spDefense;
  final int? speed;

  Base(
      {required this.HP,
      required this.Attack,
      required this.Defense,
      required this.spAttack,
      required this.speed,
      required this.spDefense});

  factory Base.formjson(Map<String, dynamic> json) {
    return Base(
      HP: json['HP'],
      Attack: json['Attack'],
      Defense: json['Defense'],
      spAttack: json['Sp. Attack'],
      spDefense: json['Sp. Defense'],
      speed: json['speed'],
    );
  }
}
