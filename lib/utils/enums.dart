enum DeliveryPlan {
  once,
  alternate,
  daily,
  custom,
}

enum EditOrderStatus {
  updated,
  cancelled,
  cancellationRequest,
  rated,
}

enum OrderStatus {
  placed,
  processing,
  delivered,
}

enum OrderType {
  oneTime,
  subscription,
}

enum WeekdayFormat {
  weekdays,
  standalone,
  short,
  standaloneShort,
  narrow,
  standaloneNarrow,
}
