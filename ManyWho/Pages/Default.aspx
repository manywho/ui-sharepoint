<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />

    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    ManyWho
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <div id="manywho">
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
                    'bfce47ee-99f5-4267-ad53-b79bff9932fd',
                    'f2517fb4-c397-42a0-b709-38da562f1c88',
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

</asp:Content>
