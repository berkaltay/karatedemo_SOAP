function() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = { //base config JSON
    env: env,
	myVarName: 'someValue',
    customerNumber: 'my.customer',
    paymentAmount: 'my.payment',
	someUrlBase: 'http://10.201.83.103:7722/Themis-Backend/PaymentWebService'
  };
  if (env == 'stage') {
    // customize
    config.someUrlBase = 'http://10.201.83.103:7722/Themis-Backend/PaymentWebService';
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
  return config;
}