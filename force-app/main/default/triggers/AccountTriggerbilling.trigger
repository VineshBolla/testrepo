trigger AccountTriggerbilling on Account (before insert) {
	
    if(Trigger.isBefore && Trigger.isInsert){
        for(Account accRec : Trigger.new){
            
            if(accRec.AnnualRevenue < 1000)
               accRec.addError('the annual revenue is less');
                
            if(accRec.ShippingCity==null)
                accRec.ShippingCity = accRec.Billingcity;
            if(accRec.ShippingCountry==null)
                accRec.ShippingCountry = accRec.BillingCountry;
            if(accRec.shippingstate==null)
                accRec.ShippingState = accRec.BillingState;
        }
    }
}