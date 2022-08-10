window.SwaggerInit = function(discoveryUrl, token) {
  $(function () {
    $.ajaxPrefilter(function(o, options){
      options.headers = { 'X-CSRF-Token': token }
    });
  });

  $(function () {
    // https://github.com/thorst/supportedBrowser.js
    (function(window, document, undefined) {
      "use strict";
      var getBrowser = function() {
          // initial values for checks
          var nAgt = navigator.userAgent, // store user agent [Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0]
            browser = navigator.appName, // browser string [Netscape]
            version = '' + parseFloat(navigator.appVersion), // version string (5) [5.0 (Windows)]
            majorVersion = parseInt(navigator.appVersion, 10) // version number (5) [5.0 (Windows)]
          ;
          var nameOffset, // used to detect other browsers name
            verOffset, // used to trim out version
            ix // used to trim string
          ;
          // Opera
          if ((verOffset = nAgt.indexOf('Opera')) !== -1) {
            browser = 'Opera';
            version = nAgt.substring(verOffset + 6);
            if ((verOffset = nAgt.indexOf('Version')) !== -1) {
              version = nAgt.substring(verOffset + 8);
            }
            // MSIE
          } else if ((verOffset = nAgt.indexOf('MSIE')) !== -1) {
            browser = 'Microsoft Internet Explorer';
            version = nAgt.substring(verOffset + 5);
            //IE 11 no longer identifies itself as MS IE, so trap it
            //http://stackoverflow.com/questions/17907445/how-to-detect-ie11
          } else if ((browser === 'Netscape') && (nAgt.indexOf('Trident/') !== -1)) {
            browser = 'Microsoft Internet Explorer';
            version = nAgt.substring(verOffset + 5);
            if ((verOffset = nAgt.indexOf('rv:')) !== -1) {
              version = nAgt.substring(verOffset + 3);
            }
            // Chrome
          } else if ((verOffset = nAgt.indexOf('Chrome')) !== -1) {
            browser = 'Chrome';
            version = nAgt.substring(verOffset + 7);
            // Chrome on iPad identifies itself as Safari. However it does mention CriOS.
          } else if ((verOffset = nAgt.indexOf('CriOS')) !== -1) {
            browser = 'Chrome';
            version = nAgt.substring(verOffset + 6);
            // Safari
          } else if ((verOffset = nAgt.indexOf('Safari')) !== -1) {
            browser = 'Safari';
            version = nAgt.substring(verOffset + 7);
            if ((verOffset = nAgt.indexOf('Version')) !== -1) {
              version = nAgt.substring(verOffset + 8);
            }
            // Firefox
          } else if ((verOffset = nAgt.indexOf('Firefox')) !== -1) {
            browser = 'Firefox';
            version = nAgt.substring(verOffset + 8);
            // Other browsers
          } else if ((nameOffset = nAgt.lastIndexOf(' ') + 1) < (verOffset = nAgt.lastIndexOf('/'))) {
            browser = nAgt.substring(nameOffset, verOffset);
            version = nAgt.substring(verOffset + 1);
            if (browser.toLowerCase() === browser.toUpperCase()) {
              browser = navigator.appName;
            }
          }
          // trim the version string
          if ((ix = version.indexOf(';')) !== -1) version = version.substring(0, ix);
          if ((ix = version.indexOf(' ')) !== -1) version = version.substring(0, ix);
          if ((ix = version.indexOf(')')) !== -1) version = version.substring(0, ix);
          // why is this here?
          majorVersion = parseInt('' + version, 10);
          if (isNaN(majorVersion)) {
            version = '' + parseFloat(navigator.appVersion);
            majorVersion = parseInt(navigator.appVersion, 10);
          }
          return {
            name: browser,
            version: majorVersion,
            versionString: version
          };
        },
        getOS = function() {
          var nVer = navigator.appVersion;
          var nAgt = navigator.userAgent;
          var osVersion = "unknown";
          var os = "unknown";
          // system
          var clientStrings = [{
            s: 'Windows 3.11',
            r: /Win16/
          }, {
            s: 'Windows 95',
            r: /(Windows 95|Win95|Windows_95)/
          }, {
            s: 'Windows ME',
            r: /(Win 9x 4.90|Windows ME)/
          }, {
            s: 'Windows 98',
            r: /(Windows 98|Win98)/
          }, {
            s: 'Windows CE',
            r: /Windows CE/
          }, {
            s: 'Windows 2000',
            r: /(Windows NT 5.0|Windows 2000)/
          }, {
            s: 'Windows XP',
            r: /(Windows NT 5.1|Windows XP)/
          }, {
            s: 'Windows Server 2003',
            r: /Windows NT 5.2/
          }, {
            s: 'Windows Vista',
            r: /Windows NT 6.0/
          }, {
            s: 'Windows 7',
            r: /(Windows 7|Windows NT 6.1)/
          }, {
            s: 'Windows 8.1',
            r: /(Windows 8.1|Windows NT 6.3)/
          }, {
            s: 'Windows 8',
            r: /(Windows 8|Windows NT 6.2)/
          }, {
            s: 'Windows NT 4.0',
            r: /(Windows NT 4.0|WinNT4.0|WinNT|Windows NT)/
          }, {
            s: 'Windows ME',
            r: /Windows ME/
          }, {
            s: 'Android',
            r: /Android/
          }, {
            s: 'Open BSD',
            r: /OpenBSD/
          }, {
            s: 'Sun OS',
            r: /SunOS/
          }, {
            s: 'Linux',
            r: /(Linux|X11)/
          }, {
            s: 'iOS',
            r: /(iPhone|iPad|iPod)/
          }, {
            s: 'Mac OS X',
            r: /Mac OS X/
          }, {
            s: 'Mac OS',
            r: /(MacPPC|MacIntel|Mac_PowerPC|Macintosh)/
          }, {
            s: 'QNX',
            r: /QNX/
          }, {
            s: 'UNIX',
            r: /UNIX/
          }, {
            s: 'BeOS',
            r: /BeOS/
          }, {
            s: 'OS/2',
            r: /OS\/2/
          }, {
            s: 'Search Bot',
            r: /(nuhk|Googlebot|Yammybot|Openbot|Slurp|MSNBot|Ask Jeeves\/Teoma|ia_archiver)/
          }];
          for (var id in clientStrings) {
            var cs = clientStrings[id];
            if (cs.r.test(nAgt)) {
              os = cs.s;
              break;
            }
          }
          if (/Windows/.test(os)) {
            osVersion = /Windows (.*)/.exec(os)[1];
            os = 'Windows';
          }
          switch (os) {
            case 'Mac OS X':
              osVersion = /Mac OS X ([\.\_\d]+)/.exec(nAgt)[1];
              break;
            case 'Android':
              osVersion = /Android ([\.\_\d]+)/.exec(nAgt)[1];
              break;
            case 'iOS':
              osVersion = /OS (\d+)_(\d+)_?(\d+)?/.exec(nVer);
              osVersion = osVersion[1] + '.' + osVersion[2] + '.' + (osVersion[3] | 0);
              break;
          }
          return {
            name: os,
            versionString: osVersion
          };
        };
      window.browserInfo = {
        browser: getBrowser(),
        os: getOS()
      };
    })(window, document);
  });

  $(function () {
    window.swaggerUi = new SwaggerUi({
      url: discoveryUrl,
      dom_id:"swagger-ui-container",
      supportHeaderParams: false,
      supportedSubmitMethods: ['get', 'post', 'put', 'delete'],
      validatorUrl: null
    });

    window.swaggerUi.load();

    $('#input_apiKey').change(function() {
      var key = $('#input_apiKey')[0].value;
      if (key && key.trim() != "") {
        swaggerUi.api.clientAuthorizations.add("key", new SwaggerClient.ApiKeyAuthorization("Authorization", "token " + key, "header"));
      }
    });

    swaggerUi.api.clientAuthorizations.add("Client-App", new SwaggerClient.ApiKeyAuthorization("X-Client-App", "swagger", "header"));
    swaggerUi.api.clientAuthorizations.add("Client-Build", new SwaggerClient.ApiKeyAuthorization("X-Client-Build", "1.0.0", "header"));
    swaggerUi.api.clientAuthorizations.add("Client-Hardware", new SwaggerClient.ApiKeyAuthorization("X-Client-Hardware", window.navigator.platform, "header"));
    swaggerUi.api.clientAuthorizations.add("Client-Os", new SwaggerClient.ApiKeyAuthorization("X-Client-Os", window.browserInfo.os.versionString, "header"));
    swaggerUi.api.clientAuthorizations.add("Client-Platform", new SwaggerClient.ApiKeyAuthorization("X-Client-Platform", window.browserInfo.os.name, "header"));
    swaggerUi.api.clientAuthorizations.add("Version", new SwaggerClient.ApiKeyAuthorization("X-Version", "v1", "header"));
    swaggerUi.api.clientAuthorizations.add("Client-Browser", new SwaggerClient.ApiKeyAuthorization("X-Client-Browser", window.browserInfo.browser.name, "header"));
    swaggerUi.api.clientAuthorizations.add("Client-Browser-Version", new SwaggerClient.ApiKeyAuthorization("X-Client-Browser-Version", window.browserInfo.browser.versionString, "header"));
  });
};
