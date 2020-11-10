import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  const User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.avatarUrl,
  });
}

class Professional {
  final String id;
  final String name;
  final String email;
  final String ocupation;
  final String avatarUrl;
  final String crm;

  const Professional({
    this.id,
    @required this.name,
    @required this.email,
    @required this.ocupation,
    @required this.avatarUrl,
    @required this.crm,
  });
 
}
