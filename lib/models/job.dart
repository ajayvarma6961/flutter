import 'package:flutter/foundation.dart';

enum JobCategory {
  all('All roles'),
  climate('Climate'),
  health('Health'),
  education('Education'),
  inclusion('Inclusion'),
  community('Community');

  final String displayName;
  const JobCategory(this.displayName);

  static JobCategory fromString(String category) {
    return JobCategory.values.firstWhere(
      (c) => c.name.toLowerCase() == category.toLowerCase() ||
             c.displayName.toLowerCase() == category.toLowerCase(),
      orElse: () => JobCategory.all,
    );
  }
}

class SdgInfo {
  final int number;
  final String title;
  final String shortDesc;
  final int colorHex;

  const SdgInfo({
    required this.number,
    required this.title,
    required this.shortDesc,
    required this.colorHex,
  });

  String get badgeText => 'SDG $number: $title';
}

@immutable
class Job {
  final String id;
  final String title;
  final String organization;
  final String location;
  final String workplaceType; // Remote, Hybrid, On-site
  final String employmentType; // Full-time, Contract, Part-time
  final String? salary; // e.g. ₹12–18 LPA or null
  final String postedDate;
  final JobCategory category;
  final String impactStatement;
  final String description;
  final List<String> responsibilities;
  final List<String> requirements;
  final List<String> skills;
  final List<SdgInfo> sdgs;
  final String applyUrl;
  final String contactEmail;
  final bool isFeatured;

  const Job({
    required this.id,
    required this.title,
    required this.organization,
    required this.location,
    required this.workplaceType,
    required this.employmentType,
    this.salary,
    required this.postedDate,
    required this.category,
    required this.impactStatement,
    required this.description,
    this.responsibilities = const [],
    this.requirements = const [],
    this.skills = const [],
    this.sdgs = const [],
    this.applyUrl = 'https://goodwork.impact/apply',
    this.contactEmail = 'careers@impactorg.example',
    this.isFeatured = false,
  });

  bool matchesQuery(String query) {
    if (query.trim().isEmpty) return true;
    final q = query.toLowerCase().trim();

    final inTitle = title.toLowerCase().contains(q);
    final inOrg = organization.toLowerCase().contains(q);
    final inLoc = location.toLowerCase().contains(q);
    final inCategory = category.displayName.toLowerCase().contains(q);
    final inSkills = skills.any((s) => s.toLowerCase().contains(q));
    final inImpact = impactStatement.toLowerCase().contains(q);
    final inDesc = description.toLowerCase().contains(q);
    final inSdg = sdgs.any((sdg) =>
        sdg.number.toString() == q ||
        sdg.title.toLowerCase().contains(q));

    return inTitle || inOrg || inLoc || inCategory || inSkills || inImpact || inDesc || inSdg;
  }

  Job copyWith({
    String? id,
    String? title,
    String? organization,
    String? location,
    String? workplaceType,
    String? employmentType,
    String? salary,
    String? postedDate,
    JobCategory? category,
    String? impactStatement,
    String? description,
    List<String>? responsibilities,
    List<String>? requirements,
    List<String>? skills,
    List<SdgInfo> ? sdgs,
    String? applyUrl,
    String? contactEmail,
    bool? isFeatured,
  }) {
    return Job(
      id: id ?? this.id,
      title: title ?? this.title,
      organization: organization ?? this.organization,
      location: location ?? this.location,
      workplaceType: workplaceType ?? this.workplaceType,
      employmentType: employmentType ?? this.employmentType,
      salary: salary ?? this.salary,
      postedDate: postedDate ?? this.postedDate,
      category: category ?? this.category,
      impactStatement: impactStatement ?? this.impactStatement,
      description: description ?? this.description,
      responsibilities: responsibilities ?? this.responsibilities,
      requirements: requirements ?? this.requirements,
      skills: skills ?? this.skills,
      sdgs: sdgs ?? this.sdgs,
      applyUrl: applyUrl ?? this.applyUrl,
      contactEmail: contactEmail ?? this.contactEmail,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }
}
