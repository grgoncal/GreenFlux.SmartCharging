using GreenFlux.SmartCharging.Extensions;
using Microsoft.Extensions.DependencyInjection;
using System;
using MediatR;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;

namespace GreenFlux.SmartCharging
{
    public class Startup
    {
        public IConfiguration _configuration;

        public Startup(IConfiguration configuration, IWebHostEnvironment env)
        {
            _configuration.GetConfiguration(env);
        }

        public void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddDependencies();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseSwagger();
            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint("/swagger/v1/swagger.json", "SmartChargingAPI");
            });

            if (env.IsDevelopment())
                app.UseDeveloperExceptionPage();

            app.UseRouting();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            app.UseStatusCodePages();
        }        
    }
}
