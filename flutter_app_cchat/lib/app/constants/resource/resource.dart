import 'package:flutter_app_cchat/app/constants/resource/barrel_resource.dart';

class AppResource {
  AppResource._();

  static List<PaymentMethod> getPaymentMethod() {
    return List.of([
      PaymentMethod.cashOnDelivery,
      PaymentMethod.bankTransfer,
      PaymentMethod.eWallet
    ]);
  }

  static List<VoucherMethod> getVoucherMethod() {
    return List.of([VoucherMethod.voucher, VoucherMethod.rank]);
  }

  static List<NotificationType> getNotificationType() {
    return List.of([NotificationType.order, NotificationType.promotion]);
  }
}
