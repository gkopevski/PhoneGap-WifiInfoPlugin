var exec = require("cordova/exec");
var wifi = {
		wifi: function(callback) {
            cordova.exec(
                    function(data) {
                        callback(data);
                    },
                    function(err) {
                        callback(err);
                    },
                    "WifiInfo",
                    'getInfo',
                    []
                    );
        },
        getSavedWifiNetworks: function(callback) {
			cordova.exec(
                    function(data) {
                        callback(data);
                    },
                    function(err) {
                        callback(err);
                    },
                    "WifiInfo",
                    'getSavedWifiNetworks',
                    []
                    );
        }
}

module.exports = wifi;
