class OrderDetailsResModel {
  int? status;
  String? message;
  OrderDetailsData? data;

  OrderDetailsResModel({this.status, this.message, this.data});

  OrderDetailsResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? OrderDetailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OrderDetailsData {
  String? ordId;
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
  DeliveryAddress? deliveryAddress;
  String? nextDeliveryDate;
  String? todaysDelivery;
  String? orderStatus;
  List<OrderDetls>? orderDetails;

  OrderDetailsData(
      {this.ordId,
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
      this.deliveryAddress,
      this.nextDeliveryDate,
      this.todaysDelivery,
      this.orderStatus,
      this.orderDetails});

  OrderDetailsData.fromJson(Map<String, dynamic> json) {
    ordId = json['ord_id'];
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
    deliveryAddress = json['deliveryAddress'] != null
        ? DeliveryAddress.fromJson(json['deliveryAddress'])
        : null;
    nextDeliveryDate = json['next_delivery_date'];
    todaysDelivery = json['todays_delivery'];
    orderStatus = json['deliveryStatus'];
    if (json['orderDetls'] != null) {
      orderDetails = <OrderDetls>[];
      json['orderDetls'].forEach((v) {
        orderDetails!.add(OrderDetls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ord_id'] = ordId;
    data['poc_order_id'] = pocOrderId;
    data['product_id'] = productId;
    data['cust_id'] = custId;
    data['customer_type'] = customerType;
    data['customer_plan'] = customerPlan;
    data['route_id'] = routeId;
    data['batch_no'] = batchNo;
    data['order_date'] = orderDate;
    data['end_date'] = endDate;
    data['delivery_boy'] = deliveryBoy;
    data['order_type'] = orderType;
    data['view_plan'] = viewPlan;
    data['location_id'] = locationId;
    data['depo_id'] = depoId;
    data['cartTotal'] = cartTotal;
    data['taxPriceTotal'] = taxPriceTotal;
    data['total_amount'] = totalAmount;
    data['package_name'] = packageName;
    data['is_cancel'] = isCancel;
    data['cancel_reason'] = cancelReason;
    data['cancel_date'] = cancelDate;
    data['remarks'] = remarks;
    data['created_date'] = createdDate;
    data['payment_method'] = paymentMethod;
    data['walletTransactionId'] = walletTransactionId;
    data['walletDiscount'] = walletDiscount;
    data['userDeliveryAddressId'] = userDeliveryAddressId;
    data['promocodeDiscount'] = promocodeDiscount;
    data['rewardDiscount'] = rewardDiscount;
    data['rewardId'] = rewardId;
    data['checkoutData'] = checkoutData;
    if (deliveryAddress != null) {
      data['deliveryAddress'] = deliveryAddress!.toJson();
    }
    data['next_delivery_date'] = nextDeliveryDate;
    data['todays_delivery'] = todaysDelivery;
    data['deliveryStatus'] = orderStatus;
    if (orderDetails != null) {
      data['orderDetls'] = orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryAddress {
  int? id;
  String? name;
  String? address1;
  String? address2;
  String? address3;
  String? city;
  String? depo;
  String? route;
  String? area;
  String? addressType;
  String? state;
  String? pincode;
  String? country;
  String? currency;
  String? lat;
  String? long;
  String? mobileNo;
  String? alternativeNo;
  String? deliveryInstruction;
  String? activeStatus;
  String? status;
  String? approval;
  String? createdAt;
  String? updatedAt;
  int? userId;
  String? selectType;
  String? defaultAddress;
  String? othername;

  DeliveryAddress(
      {this.id,
      this.name,
      this.address1,
      this.address2,
      this.address3,
      this.city,
      this.depo,
      this.route,
      this.area,
      this.addressType,
      this.state,
      this.pincode,
      this.country,
      this.currency,
      this.lat,
      this.long,
      this.mobileNo,
      this.alternativeNo,
      this.deliveryInstruction,
      this.activeStatus,
      this.status,
      this.approval,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.selectType,
      this.defaultAddress,
      this.othername});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    city = json['city'];
    depo = json['depo'];
    route = json['route'];
    area = json['area'];
    addressType = json['addressType'];
    state = json['state'];
    pincode = json['pincode'];
    country = json['country'];
    currency = json['currency'];
    lat = json['lat'];
    long = json['long'];
    mobileNo = json['mobileNo'];
    alternativeNo = json['alternativeNo'];
    deliveryInstruction = json['deliveryInstruction'];
    activeStatus = json['activeStatus'];
    status = json['status'];
    approval = json['approval'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    selectType = json['selectType'];
    defaultAddress = json['default_address'];
    othername = json['othername'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address1'] = address1;
    data['address2'] = address2;
    data['address3'] = address3;
    data['city'] = city;
    data['depo'] = depo;
    data['route'] = route;
    data['area'] = area;
    data['addressType'] = addressType;
    data['state'] = state;
    data['pincode'] = pincode;
    data['country'] = country;
    data['currency'] = currency;
    data['lat'] = lat;
    data['long'] = long;
    data['mobileNo'] = mobileNo;
    data['alternativeNo'] = alternativeNo;
    data['deliveryInstruction'] = deliveryInstruction;
    data['activeStatus'] = activeStatus;
    data['status'] = status;
    data['approval'] = approval;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    data['selectType'] = selectType;
    data['default_address'] = defaultAddress;
    data['othername'] = othername;
    return data;
  }
}

class OrderDetls {
  String? orderDetailId;
  String? quantity;
  String? productPrice;
  String? totalAmount;
  String? packageName;
  String? fromDate;
  String? toDate;
  String? productName;
  String? thumbImg;
  String? productId;
  String? deliveryStatus;
  String? todaysDelivery;
  bool? nextDeliveryDate;
  String? thumbImgUrl;

  OrderDetls(
      {this.orderDetailId,
      this.quantity,
      this.productPrice,
      this.totalAmount,
      this.packageName,
      this.fromDate,
      this.toDate,
      this.productName,
      this.thumbImg,
      this.productId,
      this.deliveryStatus,
      this.todaysDelivery,
      this.nextDeliveryDate,
      this.thumbImgUrl});

  OrderDetls.fromJson(Map<String, dynamic> json) {
    orderDetailId = json['order_detail_id'];
    quantity = json['quantity'];
    productPrice = json['product_price'];
    totalAmount = json['total_amount'];
    packageName = json['package_name'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    productName = json['product_name'];
    thumbImg = json['thumb_img'];
    productId = json['product_id'];
    deliveryStatus = json['deliveryStatus'];
    todaysDelivery = json['todays_delivery'];
    nextDeliveryDate = json['next_delivery_date'];
    thumbImgUrl = json['thumb_img_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_detail_id'] = orderDetailId;
    data['quantity'] = quantity;
    data['product_price'] = productPrice;
    data['total_amount'] = totalAmount;
    data['package_name'] = packageName;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['product_name'] = productName;
    data['thumb_img'] = thumbImg;
    data['product_id'] = productId;
    data['deliveryStatus'] = deliveryStatus;
    data['todays_delivery'] = todaysDelivery;
    data['next_delivery_date'] = nextDeliveryDate;
    data['thumb_img_url'] = thumbImgUrl;
    return data;
  }
}
