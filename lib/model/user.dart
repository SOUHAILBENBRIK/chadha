class User {
  final String name;
  final String email;
  final Roles role;
  final String password;

  User(
      {required this.name,
      required this.email,
      required this.role,
      required this.password});
}

enum Roles { chefMaintenance, chefEquipe, admin }
