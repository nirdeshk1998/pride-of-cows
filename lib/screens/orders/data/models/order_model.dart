class OrderResModel {
  int? status;
  String? message;
  List<OrderData>? data;

  OrderResModel({this.status, this.message, this.data});

  OrderResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderData>[];
      json['data'].forEach((v) {
        data!.add(OrderData.fromJson(v));
      });
    }
  }
}

class OrderData {
  String? orderId;
  String? pocOrderId;
  String? productId;
  String? custId;
  String? customerType;
  String? customerPlan;
  String? routeId;
  String? batchNo;
  String? orderDate;
  String? endDate;
  String? deliveryBoy;
  String? orderType;
  String? viewPlan;
  String? locationId;
  String? depoId;
  String? cartTotal;
  String? taxPriceTotal;
  String? totalAmount;
  String? packageName;
  String? isCancel;
  String? cancelReason;
  String? cancelDate;
  String? remarks;
  String? createdDate;
  String? paymentMethod;
  String? walletTransactionId;
  String? walletDiscount;
  String? userDeliveryAddressId;
  String? promocodeDiscount;
  String? rewardDiscount;
  String? rewardId;
  String? checkoutData;
  String? nextDeliveryDate;
  String? todaysDelivery;
  String? deliveryStatus;
  List<OrderDetls>? orderDetails;
  String? rating;

  OrderData(
      {this.orderId,
      this.pocOrderId,
      this.productId,
      this.custId,
      this.customerType,
      this.customerPlan,
      this.routeId,
      this.batchNo,
      this.orderDate,
      this.endDate,
      this.deliveryBoy,
      this.orderType,
      this.viewPlan,
      this.locationId,
      this.depoId,
      this.cartTotal,
      this.taxPriceTotal,
      this.totalAmount,
      this.packageName,
      this.isCancel,
      this.cancelReason,
      this.cancelDate,
      this.remarks,
      this.createdDate,
      this.paymentMethod,
      this.walletTransactionId,
      this.walletDiscount,
      this.userDeliveryAddressId,
      this.promocodeDiscount,
      this.rewardDiscount,
      this.rewardId,
      this.checkoutData,
      this.nextDeliveryDate,
      this.todaysDelivery,
      this.deliveryStatus,
      this.orderDetails,
      this.rating});

  OrderData.fromJson(Map<String, dynamic> json) {
    orderId = json['ord_id'];
    pocOrderId = json['poc_order_id'];
    productId = json['product_id'];
    custId = json['cust_id'];
    customerType = json['customer_type'];
    customerPlan = json['customer_plan'];
    routeId = json['route_id'];
    batchNo = json['batch_no'];
    orderDate = json['order_date'];
    endDate = json['end_date'];
    deliveryBoy = json['delivery_boy'];
    orderType = json['order_type'];
    viewPlan = json['view_plan'];
    locationId = json['location_id'];
    depoId = json['depo_id'];
    cartTotal = json['cartTotal'];
    taxPriceTotal = json['taxPriceTotal'];
    totalAmount = json['total_amount'];
    packageName = json['package_name'];
    isCancel = json['is_cancel'];
    cancelReason = json['cancel_reason'];
    cancelDate = json['cancel_date'];
    remarks = json['remarks'];
    createdDate = json['created_date'];
    paymentMethod = json['payment_method'];
    walletTransactionId = json['walletTransactionId'];
    walletDiscount = json['walletDiscount'];
    userDeliveryAddressId = json['userDeliveryAddressId'];
    promocodeDiscount = json['promocodeDiscount'];
    rewardDiscount = json['rewardDiscount'];
    rewardId = json['rewardId'];
    checkoutData = json['checkoutData'];
    nextDeliveryDate = json['next_delivery_date'];
    todaysDelivery = json['todays_delivery'];
    deliveryStatus = json['deliveryStatus'];
    if (json['orderDetls'] != null) {
      orderDetails = <OrderDetls>[];
      json['orderDetls'].forEach((v) {
        orderDetails!.add(OrderDetls.fromJson(v));
      });
    }
    rating = json['rating'];
  }
}

class OrderDetls {
  String? orderDetailId;
  String? fromDate;
  String? toDate;
  String? productName;
  String? thumbImg;
  String? productId;
  String? thumbImgUrl;

  OrderDetls({this.orderDetailId, this.fromDate, this.toDate, this.productName, this.thumbImg, this.productId, this.thumbImgUrl});

  OrderDetls.fromJson(Map<String, dynamic> json) {
    orderDetailId = json['order_detail_id'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    productName = json['product_name'];
    thumbImg = json['thumb_img'];
    productId = json['product_id'];
    thumbImgUrl = json['thumb_img_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_detail_id'] = orderDetailId;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['product_name'] = productName;
    data['thumb_img'] = thumbImg;
    data['product_id'] = productId;
    data['thumb_img_url'] = thumbImgUrl;
    return data;
  }
}
