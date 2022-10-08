class WalletBalanceResModel {
  int? status;
  Wallet? wallet;
  List<CwalletTransactions>? cwalletTransactions;
  int? noPages;

  WalletBalanceResModel(
      {this.status, this.wallet, this.cwalletTransactions, this.noPages});

  WalletBalanceResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    wallet =
        json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
    if (json['cwallet_transactions'] != null) {
      cwalletTransactions = <CwalletTransactions>[];
      json['cwallet_transactions'].forEach((v) {
        cwalletTransactions!.add(CwalletTransactions.fromJson(v));
      });
    }
    noPages = json['no_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (wallet != null) {
      data['wallet'] = wallet!.toJson();
    }
    if (cwalletTransactions != null) {
      data['cwallet_transactions'] =
          cwalletTransactions!.map((v) => v.toJson()).toList();
    }
    data['no_pages'] = noPages;
    return data;
  }
}

class Wallet {
  int? walletId;
  int? customerId;
  int? balance;
  int? rechargeBalance;
  int? createdBy;
  String? ondate;
  String? modifiedDate;

  Wallet(
      {this.walletId,
      this.customerId,
      this.balance,
      this.rechargeBalance,
      this.createdBy,
      this.ondate,
      this.modifiedDate});

  Wallet.fromJson(Map<String, dynamic> json) {
    walletId = json['wallet_id'];
    customerId = json['customer_id'];
    balance = json['balance'];
    rechargeBalance = json['recharge_balance'];
    createdBy = json['created_by'];
    ondate = json['ondate'];
    modifiedDate = json['modified_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wallet_id'] = walletId;
    data['customer_id'] = customerId;
    data['balance'] = balance;
    data['recharge_balance'] = rechargeBalance;
    data['created_by'] = createdBy;
    data['ondate'] = ondate;
    data['modified_date'] = modifiedDate;
    return data;
  }
}

class CwalletTransactions {
  int? customerWalletId;
  int? customerId;
  int? balance;
  String? paymentMethod;
  String? receiptList;
  String? receiptNo;
  int? paymentAmount;
  String? detail;
  String? chequeNo;
  String? chequeDate;
  String? chequeBank;
  String? neftTransactionId;
  String? neftBank;
  String? neftBranch;
  String? digitalTransactionId;
  String? posMachineNo;
  String? posDate;
  String? posReference;
  int? subscription;
  int? needOrderUpdate;
  String? trnOrderid;
  int? createdBy;
  String? createdDate;
  String? modifiedBy;
  String? modifiedDate;
  String? type;
  String? pocOrderId;

  CwalletTransactions(
      {this.customerWalletId,
      this.customerId,
      this.balance,
      this.paymentMethod,
      this.receiptList,
      this.receiptNo,
      this.paymentAmount,
      this.detail,
      this.chequeNo,
      this.chequeDate,
      this.chequeBank,
      this.neftTransactionId,
      this.neftBank,
      this.neftBranch,
      this.digitalTransactionId,
      this.posMachineNo,
      this.posDate,
      this.posReference,
      this.subscription,
      this.needOrderUpdate,
      this.trnOrderid,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.type,
      this.pocOrderId});

  CwalletTransactions.fromJson(Map<String, dynamic> json) {
    customerWalletId = json['customer_wallet_id'];
    customerId = json['customer_id'];
    balance = json['balance'];
    paymentMethod = json['payment_method'];
    receiptList = json['receipt_list'];
    receiptNo = json['receipt_no'];
    paymentAmount = json['payment_amount'];
    detail = json['detail'];
    chequeNo = json['cheque_no'];
    chequeDate = json['cheque_date'];
    chequeBank = json['cheque_bank'];
    neftTransactionId = json['neft_transaction_id'];
    neftBank = json['neft_bank'];
    neftBranch = json['neft_branch'];
    digitalTransactionId = json['digital_transaction_id'];
    posMachineNo = json['pos_machine_no'];
    posDate = json['pos_date'];
    posReference = json['pos_reference'];
    subscription = json['subscription'];
    needOrderUpdate = json['need_order_update'];
    trnOrderid = json['trn_orderid'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    modifiedBy = json['modified_by'];
    modifiedDate = json['modified_date'];
    type = json['type'];
    pocOrderId = json['poc_order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_wallet_id'] = customerWalletId;
    data['customer_id'] = customerId;
    data['balance'] = balance;
    data['payment_method'] = paymentMethod;
    data['receipt_list'] = receiptList;
    data['receipt_no'] = receiptNo;
    data['payment_amount'] = paymentAmount;
    data['detail'] = detail;
    data['cheque_no'] = chequeNo;
    data['cheque_date'] = chequeDate;
    data['cheque_bank'] = chequeBank;
    data['neft_transaction_id'] = neftTransactionId;
    data['neft_bank'] = neftBank;
    data['neft_branch'] = neftBranch;
    data['digital_transaction_id'] = digitalTransactionId;
    data['pos_machine_no'] = posMachineNo;
    data['pos_date'] = posDate;
    data['pos_reference'] = posReference;
    data['subscription'] = subscription;
    data['need_order_update'] = needOrderUpdate;
    data['trn_orderid'] = trnOrderid;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['modified_by'] = modifiedBy;
    data['modified_date'] = modifiedDate;
    data['type'] = type;
    data['poc_order_id'] = pocOrderId;
    return data;
  }
}
