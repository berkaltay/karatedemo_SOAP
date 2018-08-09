Feature: sample karate test script    


Background:
* url 'http://10.201.83.103:7722/Themis-Backend/PaymentWebService'

Scenario: soap 1.1

  * def user = 1000

Given request

"""
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
                   xmlns:intf="http://intf.webservice.themis.turkcelltech.com/">
    <SOAP-ENV:Header/>
    <SOAP-ENV:Body>
<intf:receiveLegalPayment>
  <arg0>
    <application>1</application>
    <operationName>test</operationName>
    <payment>
      <caseId>1000000003279</caseId>
      <contractRef>5342318856</contractRef>
      <customerNumber>925555039</customerNumber>
      <customerRef>422525413</customerRef>
      <id>0</id>
      <institutionId>1062</institutionId>
      <invoiceId>0</invoiceId>
      <opTypeId>0</opTypeId>
      <paymentAccount>1</paymentAccount>
      <paymentAmount>1.0</paymentAmount>
      <paymentDate>2018-08-07T14:06:27.364+03:00</paymentDate>
      <paymentOriginTypeId>1</paymentOriginTypeId>
      <paymentPeriod>201808</paymentPeriod>
      <paymentTypeId>1</paymentTypeId>
      <referenceId>1264284278</referenceId>
      <transactionId>3002</transactionId>
    </payment>
    <transactionDate>11-01-2018</transactionDate>
    <transactionId>2000001</transactionId>
  </arg0>
</intf:receiveLegalPayment>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""
    And header Content-Type = 'text/xml; charset=utf-8'
    #When soap action 'http://10.201.83.103:7722'  //burada action vermek yerine post diyebiliyoruz; ikisi de çalışıyor
    When method post
    Then status 200
    And match /Envelope/Body/receiveLegalPaymentResponse/return/returnCode == -12315
    And print 'response: ', response



# When method get# Then status 200
# And match response contains user

