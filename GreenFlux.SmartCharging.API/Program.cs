using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Text;

namespace GreenFlux.SmartCharging
{
    public static class Program
    {
        public static void Main(string[] args)
        {
            BuildWebHost(args).Run(); 
        }

        private static IWebHost BuildWebHost(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                   .UseStartup<Startup>()
                   .Build();
    }
}
