public class calloutHandler {
    public static void callExternalService() {
        HTTP http = new HTTP();
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint('https://api.covidtracking.com/v1/states/info.json');
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        HTTPResponse response = HTTP.send(request);
        System.debug('Response Status' + response.getStatus());
        System.debug('Body' + response.getBody());
        List<covidStateMetadataWrapper> wrappedData = (List<covidStateMetadataWrapper>) JSON.deserialize(response.getBody(), List<covidStateMetadataWrapper>.class);
        for(covidStateMetadataWrapper wrapper : wrappedData) {
            System.debug('--->' + wrapper);
        } 
    } 
    
    public Class covidStateMetadataWrapper {
        Public string state;
        Public string twitter;
        
        public covidStateMetadataWrapper(String state, String twitter) {
            this.state = state;
            this.twitter = twitter;
        }
    }
}