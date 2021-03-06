﻿using Microsoft.Owin;
using Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using Api.Providers;
using Microsoft.Owin.Security.OAuth;
using WebApiThrottle;

[assembly: OwinStartup( typeof( Api.Startup ) )]
namespace Api
{
    public class Startup
    {
        public void Configuration( IAppBuilder app )
        {
            HttpConfiguration config = new HttpConfiguration();

            //Register throttling handler
            
            app.Use( typeof( ThrottlingMiddleware ),
                ThrottlePolicy.FromStore( new PolicyConfigurationProvider() ),
                new PolicyMemoryCacheRepository(),
                new MemoryCacheRepository(),
                null );

            ConfigureOAuth( app );

            WebApiConfig.Register( config );
            app.UseCors( Microsoft.Owin.Cors.CorsOptions.AllowAll );
            app.UseWebApi( config );
        }

        public void ConfigureOAuth( IAppBuilder app )
        {
            OAuthAuthorizationServerOptions OAuthServerOptions = new OAuthAuthorizationServerOptions()
            {
                AllowInsecureHttp = true,
                TokenEndpointPath = new PathString( "/token" ),
                AccessTokenExpireTimeSpan = TimeSpan.FromMinutes( 30 ),
                Provider = new SimpleAuthorizationServerProvider(),
                RefreshTokenProvider = new SimpleRefreshTokenProvider()
            };

            // Token Generation
            app.UseOAuthAuthorizationServer( OAuthServerOptions );
            app.UseOAuthBearerAuthentication( new OAuthBearerAuthenticationOptions() );

        }
    }
}