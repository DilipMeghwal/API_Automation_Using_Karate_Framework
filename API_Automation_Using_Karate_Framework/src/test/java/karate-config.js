function fn() {
	var env = karate.env; // get java system property 'karate.env'
	karate.log('karate.env system property was:', env);
	if (!env) {
		env = 'dev'; // a custom 'intelligent' default
	}
	var config = { // base config JSON
		appId: 'my.app.id',
		appSecret: 'my.secret',
		baseUrl: 'https://reqres.in',
		anotherUrlBase: 'https://another-host.com/v1/'
	};
	if (env == 'qa') {
		// over-ride only those that need to be
		config.baseUrl = 'https://reqres.in';
		karate.log("Envieonmenr variable value is ---> ", env)
	} else if (env == 'e2e') {
		config.baseUrl = 'https://dev.reqres.in';
	}
	
	//This is to call a featire file once to get the auth token.
	var authResult = karate.callSingle('authToken.feature');
	config.authInfo = authResult;
	config.auth = {response:authResult.response}
	
	
	// don't waste time waiting for a connection or if servers don't respond within 5 seconds
	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	return config;
	//you may want to initialize (e.g. auth tokens) only once for all of your tests. This can be achieved using karate.callSingle()
}