window.wifi = function(callback) {
    cordova.exec(
            function(data){callback(data);},
            function(err){callback(err);},
            "WifiInfo",
            'getInfo',
            []
    );
};
window.getSavedWifiNetworks = function(callback) {
    cordova.exec(
            function(data){callback(data);},
            function(err){callback(err);},
            "WifiInfo",
            'getSavedWifiNetworks',
            []
    );
};