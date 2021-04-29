using GreenFlux.SmartCharging.API.Application.Mediator.Commands.Groups;
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
    public class GroupController : Controller
    {
        private readonly IMediator _mediator;

        public GroupController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("GetAllGroups")]
        public IActionResult GetAllGroups()
        {
            var getAllGroupsCommand = new GetAllGroupsCommand();
            var result = _mediator.Send(getAllGroupsCommand).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);

            return Ok(result);
        }

        [HttpPost("CreateGroup")]
        public IActionResult Create([FromBody] CreateGroupCommand command)
        {
            if (command == null)
                return BadRequest();

            var result = _mediator.Send(command).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);
            
            var group = result.Content as Group;

            return Created($"{HttpContext.Request.GetUri()}/{group.Id}", result);
        }

        [HttpPut("{id}/UpdateGroup")]
        public IActionResult Update(long id, [FromBody]UpdateGroupCommand command)
        {
            if (command == null)
                return BadRequest();

            var result = _mediator.Send(command).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);

            return NoContent();
        }

        [HttpDelete("{id}/DeleteGroup")]
        public IActionResult Delete(long id)
        {
            if (id <= 0)
                return BadRequest();

            var group = new Group(id);
            var deleteConnectorCommand = new DeleteGroupCommand() { Group = group };

            var result = _mediator.Send(deleteConnectorCommand).Result;

            if (!string.IsNullOrEmpty(result.ErrorMessage))
                return StatusCode(200, result);

            return StatusCode(422, group);
        }
    }
}
