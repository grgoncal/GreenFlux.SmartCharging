using GreenFlux.SmartCharging.API.Application.Mediator.Commands.Connectors;
using GreenFlux.SmartCharging.Domain.Entities;
using MediatR;
using Microsoft.ApplicationInsights.AspNetCore.Extensions;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GreenFlux.SmartCharging.API.Controllers
{
    [Route("api/[controller]")]
    public class ConnectorController : Controller
    {
        private readonly IMediator _mediator;

        public ConnectorController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("GetAllConnectors")]
        public IActionResult GetAllConnectors()
        {
            var getAllConnectorsCommand = new GetAllConnectorsCommand();
            var result = _mediator.Send(getAllConnectorsCommand).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);

            return Ok(result);
        }

        [HttpPost("CreateConnector")]
        public IActionResult Create([FromBody] CreateOrUpdateConnectorCommand command)
        {
            if (command == null)
                return BadRequest();

            var result = _mediator.Send(command).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);

            var connector = result.Content as Connector;

            return Created($"{HttpContext.Request.GetUri()}/{connector.Id}", result);
        }

        [HttpPut("{id}/UpdateConnector")]
        public IActionResult Update([FromBody] CreateOrUpdateConnectorCommand command)
        {
            if (command == null)
                return BadRequest();

            var result = _mediator.Send(command).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);

            return Ok(result);
        }


        [HttpDelete("{id}/DeleteConnector")]
        public IActionResult Delete(long id)
        {
            if (id <= 0)
                return BadRequest();

            var connector = new Connector(id);
            var deleteConnectorCommand = new DeleteConnectorCommand() { Connector = connector };

            var result = _mediator.Send(deleteConnectorCommand).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);

            return StatusCode(422, result);
        }
    }
}           