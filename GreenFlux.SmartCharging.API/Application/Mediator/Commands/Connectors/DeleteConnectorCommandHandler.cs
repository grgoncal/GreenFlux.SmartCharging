using GreenFlux.SmartCharging.API.Application.Mediator.Base;
using GreenFlux.SmartCharging.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartCharging.API.Application.Mediator.Commands.Connectors
{
    public class DeleteConnectorCommandHandler : AbstractRequesHandler<DeleteConnectorCommand>
    {
        private readonly IConnectorRepository _connectorRepository;

        public DeleteConnectorCommandHandler(IConnectorRepository connectorRepository)
        {
            _connectorRepository = connectorRepository;
        }

        internal override HandleResponse HandleIt(DeleteConnectorCommand request, CancellationToken cancellationToken)
        {
            var connector = request.Connector;

            _connectorRepository.DeleteConnector(connector);

            return new HandleResponse() { Content = connector };
        }
    }
}
