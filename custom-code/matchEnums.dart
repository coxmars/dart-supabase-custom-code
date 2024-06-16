RoleEnum convertRole(String role) {
  switch (role) {
    case 'USER':
      return RoleEnum.USER;
    case 'COMEDIAN':
      return RoleEnum.COMEDIAN;
    default:
      throw Exception('Unknown role: $role');
  }
}