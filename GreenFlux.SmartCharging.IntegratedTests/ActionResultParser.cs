using GreenFlux.SmartCharging.Domain.Entities.Mediator.Base;
using Microsoft.AspNetCore.Mvc;
using NUnit.Framework;
using System;

namespace GreenFlux.SmartCharging.IntegratedTests
{
    public static class ActionResultParser
    {
        public static T ParseCreatedResult<T>(IActionResult actionResult, out string errorMessage)
        {
            var createdResult = actionResult as CreatedResult;
            var createdResponse = createdResult.Value as Response;

            errorMessage = createdResponse.ErrorMessage;

            return (T)createdResponse.Content;
        }

        public static T ParseOkObjectResult<T>(IActionResult actionResult, out string errorMessage)
        {
            var okResult = actionResult as OkObjectResult;
            var okResponse = okResult.Value as Response;

            errorMessage = okResponse.ErrorMessage;

            return (T)okResponse.Content;
        }

        public static T ParseObjectResult<T>(IActionResult actionResult, out string errorMessage)
        {
            var objectResult = actionResult as ObjectResult;
            var objectResponse = objectResult.Value as Response;

            errorMessage = objectResponse.ErrorMessage;

            return (T)objectResponse.Content;
        }
    }
}
