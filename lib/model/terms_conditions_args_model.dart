class TermsAndConditionArgumentModel {
  String title = "";
  String details = "";

  TermsAndConditionArgumentModel.isEmpty();

  TermsAndConditionArgumentModel.required({required this.title,required this.details});
}
