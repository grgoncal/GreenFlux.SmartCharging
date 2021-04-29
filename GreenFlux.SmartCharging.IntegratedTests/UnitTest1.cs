using GreenFlux.SmartChargin.API.Controllers;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using NUnit.Framework;
using System;
using System.Web.Http;
using System.Web.Http.Results;

namespace GreenFlux.SmartCharging.IntegratedTests
{
    public class GroupContollerTest
    {
        private GroupController _groupController;
        private IMediator _mediator;

        [SetUp]
        public void Setup() 
        {
            _mediator = IoC.GetMediator();
            _groupController = new GroupController(_mediator);
        }

        [Test] 
        public void Test1()
        {
            var actionResult =  _groupController.GetAllGroups();
            
            var getResult = actionResult as OkObjectResult;

            Assert.AreEqual(200, getResult.StatusCode);
        }
    }
}