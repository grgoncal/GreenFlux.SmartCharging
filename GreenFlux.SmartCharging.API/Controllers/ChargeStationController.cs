using GreenFlux.SmartCharging.API.Application.Mediator.Commands.ChargeStations;
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
    public class ChargeStationController : Controller
    {
        private readonly IMediator _mediator;

        public ChargeStationController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("GetAllChargeStations")]
        public IActionResult GetAllChargeStations()
        {
            var getAllChargeStationsCommand = new GetAllChargeStationsCommand();
            var result = _mediator.Send(getAllChargeStationsCommand).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);

            return Ok(result);
        }

        [HttpPost("CreateChargeStation")]
        public IActionResult Create([FromBody] CreateChargeStationCommand command)
        {
            if (command == null)
                return BadRequest();

            var result = _mediator.Send(command).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);

            var chargeStation = result.Content as ChargeStation;

            return Created($"{HttpContext.Request.GetUri()}/{chargeStation.Id}", result);
        }

        [HttpDelete("{id}/DeleteChargeStation")]
        public IActionResult Delete(long id)
        {
            if (id <= 0)
                return BadRequest();

            var chargeStation = new ChargeStation(id);
            var deleteChargeStationCommand = new DeleteChargeStationCommand() { ChargeStation = chargeStation };

            var result = _mediator.Send(deleteChargeStationCommand).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);

            return StatusCode(422, chargeStation);
        }

        [HttpPut("{id}/UpdateChargeStation")]
        public IActionResult Update([FromBody] UpdateChargeStationCommand command)
        {
            if (command == null)
                return BadRequest();

            var result = _mediator.Send(command).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);

            return NoContent();
        }
    }
}
