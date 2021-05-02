using GreenFlux.SmartCharging.Domain.Repositories;
using GreenFlux.SmartCharging.Infrastructure.Repositories;
using MediatR;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security.Principal;
using System.Text;

namespace GreenFlux.SmartCharging.Extensions
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection AddDependencies(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddMvc();
            serviceCollection.AddControllers();

            serviceCollection.AddSwaggerGen(swagger =>
            {
                swagger.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo { Title = "GreenFlux Smart Charging API", Version = "v1" });
                // Security layer would be added here
            });

            serviceCollection.AddMediatR(typeof(Startup));
            serviceCollection.AddMediatR(typeof(IRequestHandler<>));
            serviceCollection.AddMediatR(typeof(IRequestHandler<,>));
            serviceCollection.AddMediatR(typeof(INotificationHandler<>));
           
            serviceCollection.TryAddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            serviceCollection.TryAddSingleton<IActionContextAccessor, ActionContextAccessor>();

            serviceCollection.AddScoped<IGroupRepository, GroupRepository>();
            serviceCollection.AddScoped<IConnectorRepository, ConnectorRepository>();
            serviceCollection.AddScoped<IChargeStationRepository, ChargeStationRepository>();

            return serviceCollection;
        }

    }
}
