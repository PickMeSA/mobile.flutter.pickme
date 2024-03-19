import 'package:pickme/shared/in_app_purchases/presentation/models/in_app_purchase_events.dart';
import 'package:test/test.dart';


void main() {
  test('InAppPurchaseEvent Equatable Implementation', () {
     const subscriptionOne = SubscriptionFound(userId: "abc", subscribedProductId: "1");


     const subscriptionTwo = SubscriptionFound(userId: "abc", subscribedProductId: "1");
     const subscriptionThree = SubscriptionFound(userId: "ab", subscribedProductId: "1");
     const subscriptionFour = SubscriptionFound(userId: "abc", subscribedProductId: "11");

     expect(subscriptionOne.getEventName(),'subscription_found');
     expect(subscriptionOne, subscriptionTwo);
     expect(subscriptionOne==subscriptionThree, false);
     expect(subscriptionOne==subscriptionFour, false);
  });


  test('SubscriptionNotFound Equatable Implementation', () {
    const subscriptionOne = SubscriptionNotFound(userId: "abc");
    const subscriptionTwo = SubscriptionNotFound(userId: "abc");
    const subscriptionThree = SubscriptionNotFound(userId: "ab");

    expect(subscriptionOne.getEventName(),'subscription_not_found');
    expect(subscriptionOne, subscriptionTwo);
    expect(subscriptionOne==subscriptionThree, false);
  });

  test('SubscriptionRestored Equatable Implementation', () {
    const subscriptionOne = SubscriptionRestored(userId: "abc", restoredProductId: "1");
    const subscriptionTwo = SubscriptionRestored(userId:"abc", restoredProductId: "1");
    const subscriptionThree = SubscriptionRestored(userId:"ab", restoredProductId: "1");
    const subscriptionFour = SubscriptionRestored(userId:"abc", restoredProductId: "11");

    expect(subscriptionOne.getEventName(),'subscription_restored');
    expect(subscriptionOne, subscriptionTwo);
    expect(subscriptionOne==subscriptionThree, false);
    expect(subscriptionOne==subscriptionFour, false);
  });
}