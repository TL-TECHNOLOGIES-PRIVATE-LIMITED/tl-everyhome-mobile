class EnablerProfileModel {
  String jobTitle;
  String contactNumber;
  List<String> skills;
  String workExperience;
  String description;
  double hourlyRate;
  List<String> portfolioImages;

  EnablerProfileModel({
    required this.jobTitle,
    required this.contactNumber,
    required this.skills,
    required this.workExperience,
    required this.description,
    required this.hourlyRate,
    required this.portfolioImages,
  });

  // You can also add methods to this class if necessary, e.g. for validation
  bool isValid() {
    return jobTitle.isNotEmpty &&
        contactNumber.isNotEmpty &&
        skills.isNotEmpty &&
        hourlyRate > 0;
  }
}
