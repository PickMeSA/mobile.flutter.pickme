
import 'package:pickme/shared/in_app_purchases/presentation/in_app_purchase_bloc.dart';
import 'package:test/test.dart';


void main() {
  test('InAppPurchaseEvent Equatable Implementation', () {
     var subscriptionOne = SubscriptionFoundEvent(userId: "abc", subscribedProductId: "1");


     var subscriptionTwo = SubscriptionFoundEvent(userId: "abc", subscribedProductId: "1");
     var subscriptionThree = SubscriptionFoundEvent(userId: "ab", subscribedProductId: "1");
     var subscriptionFour = SubscriptionFoundEvent(userId: "abc", subscribedProductId: "11");

     expect(subscriptionOne.getEventName(),'subscription_found');
     expect(subscriptionOne, subscriptionTwo);
     expect(subscriptionOne==subscriptionThree, false);
     expect(subscriptionOne==subscriptionFour, false);
  });



  test('SubscriptionRestored Equatable Implementation', () {
    var subscriptionOne = SubscriptionRestored(userId: "abc", restoredProductId: "1");
    var subscriptionTwo = SubscriptionRestored(userId:"abc", restoredProductId: "1");
    var subscriptionThree = SubscriptionRestored(userId:"ab", restoredProductId: "1");
    var subscriptionFour = SubscriptionRestored(userId:"abc", restoredProductId: "11");

    expect(subscriptionOne.getEventName(),'subscription_restored');
    expect(subscriptionOne, subscriptionTwo);
    expect(subscriptionOne==subscriptionThree, false);
    expect(subscriptionOne==subscriptionFour, false);
  });
}