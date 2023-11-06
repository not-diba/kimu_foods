
String formatAmount(double amount) {
  return 'KES. ${amount.toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match match) => '${match[1]},',
  )}';
}