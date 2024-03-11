import 'package:pickme/shared/in_app_purchases/presentation/models/in_app_purchase_events.dart';
import 'package:test/test.dart';


void main() {
  test('InAppPurchaseEvent Equatable Implementation', () {
     const subscriptionOne = SubscriptionFound("abc","1");


     const subscriptionTwo = SubscriptionFound("abc","1");
     const subscriptionThree = SubscriptionFound("ab","1");
     const subscriptionFour = SubscriptionFound("abc","11");

     expect(subscriptionOne.getEventName(),'subscription_found');
     expect(subscriptionOne, subscriptionTwo);
     expect(subscriptionOne==subscriptionThree, false);
     expect(subscriptionOne==subscriptionFour, false);
  });


  test('SubscriptionNotFound Equatable Implementation', () {
    const subscriptionOne = SubscriptionNotFound("abc");
    const subscriptionTwo = SubscriptionNotFound("abc");
    const subscriptionThree = SubscriptionNotFound("ab");

    expect(subscriptionOne.getEventName(),'subscription_not_found');
    expect(subscriptionOne, subscriptionTwo);
    expect(subscriptionOne==subscriptionThree, false);
  });

  test('SubscriptionRestored Equatable Implementation', () {
    const subscriptionOne = SubscriptionRestored("abc","1");
    const subscriptionTwo = SubscriptionRestored("abc","1");
    const subscriptionThree = SubscriptionRestored("ab","1");
    const subscriptionFour = SubscriptionRestored("abc","11");

    expect(subscriptionOne.getEventName(),'subscription_restored');
    expect(subscriptionOne, subscriptionTwo);
    expect(subscriptionOne==subscriptionThree, false);
    expect(subscriptionOne==subscriptionFour, false);
  });
}