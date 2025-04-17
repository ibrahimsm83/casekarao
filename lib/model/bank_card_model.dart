class BankCardModel {
  final String bankName;
  final String holderName;
  final String accountNumber;
   bool isSelected;

  BankCardModel({
    required this.bankName,
    required this.holderName,
    required this.accountNumber,
    required this.isSelected,
  });
}