using Contract.DatabaseContext;
using DatabaseClient.Repositories;
using Contract.DatabaseContext;
using DVDRental.Resolver;
using Microsoft.Practices.Unity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace DVDRental
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            var container = new UnityContainer();            
         
            container.RegisterType<IFilmContext, FilmContext>(new HierarchicalLifetimeManager());
            config.DependencyResolver = new UnityResolver(container);

            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
