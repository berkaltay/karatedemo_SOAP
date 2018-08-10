Feature: sample karate test script

Background:

* url 'http://10.201.83.103:7722/Themis-Backend/PaymentWebService'

Scenario: soap 1.1

  * def req = read('../request.xml')
  * set req //caseId = 51420525
  * print req //caseId

Given request req

    And header Content-Type = 'text/xml; charset=utf-8'
    #When soap action 'http://10.201.83.103:7722'  //burada action vermek yerine post diyebiliyoruz; ikisi de çalışıyor
    When method post
    Then status 200
    And match /Envelope/Body/receiveLegalPaymentResponse/return/returnCode == -12315
    And print 'response: ', response



# When method get# Then status 200
# And match response contains user

