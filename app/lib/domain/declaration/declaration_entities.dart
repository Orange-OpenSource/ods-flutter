/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT license,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'dart:convert';

import 'package:intl/intl.dart';

Declaration entityDeclarationFromJson(String str) =>
    Declaration.fromJson(json.decode(str));

class Declaration {
  late String auditDate;
  late Referential referential;
  late Technologies technologies;
  late List<Result> results;
  late int averageConformity;

  Declaration({
    required this.auditDate,
    required this.referential,
    required this.technologies,
    required this.results,
    required this.averageConformity,
  });

  factory Declaration.fromJson(Map<String, dynamic> json) {
    List<Result> resultItems = [];
    var resultsData = json['declaration']['results'];

    if (resultsData != null) {
      resultItems = List<Result>.from(
          resultsData['result'].map((x) => Result.fromJson(x)));
    }

    int totalConformity = 0;
    int numberOfResults = resultItems.length;
    for (var result in resultItems) {
      totalConformity += result.conformity;
    }
    int roundedAverageConformity =
        numberOfResults > 0 ? (totalConformity / numberOfResults).round() : 0;

    return Declaration(
      auditDate: json['declaration']['audit_date'] != null
          ? DateFormat('MMMM d, yyyy')
              .format(DateTime.parse(json['declaration']['audit_date']))
          : '',
      referential: Referential.fromJson(json['declaration']['referential']),
      technologies: Technologies.fromJson(json['declaration']['technologies']),
      results: resultItems,
      averageConformity: roundedAverageConformity,
    );
  }
}

class Referential {
  late String name;
  late double version;
  late String level;
  late String url;

  Referential({
    required this.name,
    required this.version,
    required this.level,
    required this.url,
  });

  factory Referential.fromJson(Map<String, dynamic> json) {
    return Referential(
      name: json['name'],
      version: json['version'],
      level: json['level'],
      url: json['url'],
    );
  }

  @override
  String toString() {
    return '$name $version $level';
  }
}

class Technologies {
  late String technology;

  Technologies({
    required this.technology,
  });

  factory Technologies.fromJson(Map<String, dynamic> json) {
    return Technologies(
      technology: json['technology'],
    );
  }
}

class Result {
  late int criteria;
  late int ok;
  late int nok;
  late int na;
  late int conformity;

  Result({
    required this.criteria,
    required this.ok,
    required this.nok,
    required this.na,
    required this.conformity,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      criteria: json['criteria'],
      ok: json['ok'],
      nok: json['nok'],
      na: json['na'],
      conformity: json['conformity'],
    );
  }
}
