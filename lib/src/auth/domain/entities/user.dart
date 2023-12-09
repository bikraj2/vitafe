import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.firstName,
    required this.email,
    required this.username,
    required this.lastName,
    required this.id,
    this.middleName = '',
  });

  const LocalUser.empty()
      : this(
          email: '',
          id: '',
          firstName: '',
          lastName: '',
          middleName: '',
          username: '',
        );
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String? middleName;
  final String id;

  @override
  List<Object> get props => [email, id];

  @override
  String toString() {
    return 'LocalUser{firstName: $firstName, lastName: $lastName, '
        'email: $email,'
        ' username: $username, middleName: $middleName,}';
  }
}
