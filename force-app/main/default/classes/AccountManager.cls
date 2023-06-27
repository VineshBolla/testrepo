@RestResource(urlMapping='/account/v1/*')
global class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest req = RestContext.request;
        String accountNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        return [select Id, Name, Industry, Rating, Website, Phone from Account where accountNumber =: accountNumber and Phone = null];
    }
    @HttpPost
    global static ID createAccount(String name, String rating,
        String website, String industry) {
        Account thisAccount = new Account(
            Name=name,
            Industry=industry,
            Rating=rating,
            Website=website);
        insert thisAccount;
        return thisAccount.Id;
    }   
    @HttpDelete
    global static void deleteAccount() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Account thisAccount = [SELECT Id FROM Account WHERE Id = :accountId];
        delete thisAccount;
    }
}