import 'package:deemusiq/models/wallet/payment_method.dart';

enum TokenTransactionType {
  topUp,
  push,
  support,
  bonus,
  refund;

  bool get isCredit =>
      this == topUp || this == bonus || this == refund;

  String get label {
    switch (this) {
      case TokenTransactionType.topUp:
        return "Top-up";
      case TokenTransactionType.push:
        return "Song push";
      case TokenTransactionType.support:
        return "Creator support";
      case TokenTransactionType.bonus:
        return "Bonus";
      case TokenTransactionType.refund:
        return "Refund";
    }
  }
}

/// A single immutable ledger entry. [tokens] is signed: positive credits the
/// balance, negative debits it. The running balance is derived by the wallet,
/// never stored on the entry, so the ledger stays the source of truth.
class TokenTransaction {
  final String id;
  final TokenTransactionType type;
  final int tokens;
  final DateTime timestamp;
  final String description;

  // Optional context for pushes / supports.
  final String? songId;
  final String? songTitle;
  final String? artistId;
  final String? artistName;

  // Optional context for top-ups.
  final double? fiatAmount;
  final String? currencyCode;
  final PaymentMethodKind? paymentMethod;

  const TokenTransaction({
    required this.id,
    required this.type,
    required this.tokens,
    required this.timestamp,
    required this.description,
    this.songId,
    this.songTitle,
    this.artistId,
    this.artistName,
    this.fiatAmount,
    this.currencyCode,
    this.paymentMethod,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type.name,
        "tokens": tokens,
        "timestamp": timestamp.toIso8601String(),
        "description": description,
        "songId": songId,
        "songTitle": songTitle,
        "artistId": artistId,
        "artistName": artistName,
        "fiatAmount": fiatAmount,
        "currencyCode": currencyCode,
        "paymentMethod": paymentMethod?.name,
      };

  factory TokenTransaction.fromJson(Map<String, dynamic> json) {
    return TokenTransaction(
      id: json["id"] as String,
      type: TokenTransactionType.values.firstWhere(
        (e) => e.name == json["type"],
        orElse: () => TokenTransactionType.topUp,
      ),
      tokens: (json["tokens"] as num).toInt(),
      timestamp: DateTime.tryParse(json["timestamp"] as String? ?? "") ??
          DateTime.fromMillisecondsSinceEpoch(0),
      description: json["description"] as String? ?? "",
      songId: json["songId"] as String?,
      songTitle: json["songTitle"] as String?,
      artistId: json["artistId"] as String?,
      artistName: json["artistName"] as String?,
      fiatAmount: (json["fiatAmount"] as num?)?.toDouble(),
      currencyCode: json["currencyCode"] as String?,
      paymentMethod: json["paymentMethod"] == null
          ? null
          : PaymentMethodKind.values.firstWhere(
              (e) => e.name == json["paymentMethod"],
              orElse: () => PaymentMethodKind.demoCredit,
            ),
    );
  }
}
