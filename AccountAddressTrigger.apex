trigger AccountAddressTrigger on Account (before insert, before update) {
    for (Account a : Trigger.New) {
        if (a.Match_Billing_Address__c == true && a.BillingPostalCode != null) {
            // If Match Billing Address is true and Billing Postal Code is not null,
            // set Shipping Postal Code to match Billing Postal Code
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
}