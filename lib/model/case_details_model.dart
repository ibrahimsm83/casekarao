

class CaseDetailsModel {
  final String mileStoneNumber;
  final String mileStoneStatus;
  final String caseName;
  final String caseDesc;
  final int docCount;
  final int caseDiscussionCount;
  final double amount;
  final String paymentStatus;
  final int expiryDays;

  CaseDetailsModel({
    required this.mileStoneNumber,
    required this.mileStoneStatus,
    required this.caseName,
    required this.caseDesc,
    required this.docCount,
    required this.caseDiscussionCount,
    required this.amount,
    required this.paymentStatus,
    required this.expiryDays,
  });
}
