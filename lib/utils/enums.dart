enum DeliveryPlan {
  daily,
  alternate,
  once,
  custom,
}

enum EditOrderStatus {
  updated,
  cancelled,
  cancellationRequest,
  rated,
}

enum NavigationMenu {
  home,
  products,
  cart,
  menu,
}

enum ResponseStatus {
  error,
  success,
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

enum UserType {
  user,
  guest,
}

enum AddressType {
  add,
  edit,
}
