using GreenFlux.SmartCharging.API.Application.Mediator.Base;
using GreenFlux.SmartCharging.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartCharging.API.Application.Mediator.Commands.Connectors
{
    public class GetAllConnectorsCommandHandler : AbstractRequesHandler<GetAllConnectorsCommand>
    {
        private readonly IConnectorRepository _connectorRepository;

        public GetAllConnectorsCommandHandler(IConnectorRepository connectorRepository)
        {
            _connectorRepository = connectorRepository;
        }

        internal override HandleResponse HandleIt(GetAllConnectorsCommand request, CancellationToken cancellationToken)
        {
            var connectorList = _connectorRepository.GetAllConnectors();

            return new HandleResponse() { Content = connectorList };
        }
    }
}
