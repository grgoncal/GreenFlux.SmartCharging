using GreenFlux.SmartCharging.Domain.Repositories;
using GreenFlux.SmartCharging.Infrastructure.Repositories;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Text;

namespace GreenFlux.SmartCharging.IntegratedTests
{
    [SetUpFixture]
    public class IoC
    {
        public static IServiceCollection ServiceCollection { get; set; }
        public static IServiceProvider ServiceProvider { get; set; }

        [OneTimeSetUp]
        public void AssemblyInit()
        {
            IoC.ServiceCollection = new ServiceCollection();
            IoC.ServiceCollection.AddScoped<IMediator, Mediator>();

            IoC.ServiceCollection.AddMediatR(typeof(GreenFlux.SmartCharging.Startup).Assembly);
            IoC.ServiceCollection.AddMediatR(typeof(IRequestHandler<>));
            IoC.ServiceCollection.AddMediatR(typeof(IRequestHandler<,>));
            IoC.ServiceCollection.AddMediatR(typeof(INotificationHandler<>));

            IoC.ServiceCollection.AddMvc();
            IoC.ServiceCollection.AddControllers();

            IoC.ServiceCollection.TryAddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            IoC.ServiceCollection.TryAddSingleton<IActionContextAccessor, ActionContextAccessor>();

            IoC.ServiceCollection.AddScoped<IGroupRepository, GroupRepository>();
            IoC.ServiceCollection.AddScoped<IConnectorRepository, ConnectorRepository>();
            IoC.ServiceCollection.AddScoped<IChargeStationRepository, ChargeStationRepository>();

            var config = new ConfigurationBuilder().AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                                                   .AddEnvironmentVariables().Build();
            IoC.ServiceCollection.AddSingleton<IConfiguration>(config);

            ServiceProvider = IoC.ServiceCollection.BuildServiceProvider();
        }

        public static IMediator GetMediator()
        {
            return ServiceProvider.GetService<IMediator>();
        }

        public static IGroupRepository GetGroupRepository()
        {
            return ServiceProvider.GetService<IGroupRepository>();
        }

        public static ControllerContext SetControllerContext()
        {
            return new ControllerContext
            {
                HttpContext = new DefaultHttpContext()
            };
        }
    }
}
