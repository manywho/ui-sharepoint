<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" Language="C#" %>

<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<!-- The following tells SharePoint to allow this page to be hosted in an IFrame -->
<WebPartPages:AllowFraming runat="server" />

<html>
<head>
    <!-- The following scripts are needed when using the SharePoint object model -->
    <script type="text/javascript" src="/_layouts/15/MicrosoftAjax.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />

    <script type="text/javascript">
        'use strict';

        // Set the style of the client web part page to be consistent with the host web
        (function () {
            var hostUrl = '';
            var link = document.createElement('link');
            link.setAttribute('rel', 'stylesheet');
            if (document.URL.indexOf('?') != -1) {
                var params = document.URL.split('?')[1].split('&');
                for (var i = 0; i < params.length; i++) {
                    var p = decodeURIComponent(params[i]);
                    if (/^SPHostUrl=/i.test(p)) {
                        hostUrl = p.split('=')[1];
                        link.setAttribute('href', hostUrl + '/_layouts/15/defaultcss.ashx');
                        break;
                    }
                }
            }
            if (hostUrl == '') {
                link.setAttribute('href', '/_layouts/15/1033/styles/themable/corev15.css');
            }
            document.head.appendChild(link);
        })();
    </script>
</head>

<body class="clientwebpart-body">

    <div id="manywho" class="clientwebpart-div">
        <div id="loader" style="width: 100%; height: 100%; background: black; opacity: 0.3;">
            <div style="position: absolute; width: 100%; top: 50%; left: 0; margin-top: -4em; text-align: center; color: white;">
                <p style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 2em">Initializing</p>
            </div>
        </div>
    </div>
	
    <script src="https://assets.manywho.com/js/vendor/jquery.min.js"></script>
    <script src="https://assets.manywho.com/js/vendor/bootstrap.min.js"></script>
    <script src="https://assets.manywho.com/js/vendor/react.min.js"></script>
    <script src="https://assets.manywho.com/js/vendor/socket.io-1.3.2.js"></script>
    <script src="https://assets.manywho.com/js/vendor/chosen.jquery.min.js"></script>
    <script src="https://assets.manywho.com/js/vendor/moment-with-locales.min.js"></script>
    <script src="https://assets.manywho.com/js/vendor/loglevel.min.js"></script>
    <script>
		
        var manywho = {
            cdnUrl: 'https://assets.manywho.com',
            initialize: function () {
                
				var queryParameters = manywho.utils.parseQueryString(window.location.search.substring(1));
                
				manywho.settings.initialize({
                    adminTenantId: ManyWhoConstants.MANYWHO_ADMIN_TENANT_ID,
                    playerUrl: [ location.protocol, '//', location.host, location.pathname ].join(''),
                    joinUrl: [ location.protocol, '//', location.host, location.pathname ].join(''),
					platform: {
                        uri: 'https://flow.manywho.com'
                    }
                });
				
                var options = {
                    authentication: {
                        sessionId: queryParameters['session-token'],
                        sessionUrl: queryParameters['session-url']
                    },
                    navigationElementId: queryParameters['navigation-element-id'],
                    mode: queryParameters['mode'],
                    reportingMode: queryParameters['reporting-mode'],
                    trackLocation: false,
                    replaceUrl: true,
                    collaboration: {
                        isEnabled: false
                    },
                    autoFocusInput: true,
                    inputs: null,
                    annotations: null,
                    collapsible: true,
                    navigation: {
                        isFixed: true
                    },
					isFullWidth: true,
                    callbacks: []
                };

                manywho.engine.initialize(
                    '9f40bd7f-4b67-4a45-a4c0-c66d58a750e2',
                    '54812e9f-2bec-48f9-9279-3c08e80825dd',
                    queryParameters['flow-version-id'],
                    'main',
                    queryParameters['join'],
                    queryParameters['authorization'],
                    options,
                    queryParameters['initialization']
                );
				
				manywho.theming.apply('cosmo');
            }
        };
		
    </script>
    <script src="https://flow.manywho.com/js/constants"></script>
	<script src="https://assets.manywho.com/js/loader.min.js"></script>

</body>
</html>
