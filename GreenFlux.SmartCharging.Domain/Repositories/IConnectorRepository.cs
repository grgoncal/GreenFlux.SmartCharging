using GreenFlux.SmartCharging.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace GreenFlux.SmartCharging.Domain.Repositories
{
    public interface IConnectorRepository
    {
        void CreateConnector(Connector connector);
        void UpdateConnector(Connector connector);
        Connector GetConnectorById(long id);
        List<Connector> GetConnectorsByChargeStationId(long chargeStationId);
        List<Connector> GetConnectorsByChargeStationIds(List<ChargeStation> chargeStationList);
        void DeleteConnector(Connector connector);
        List<Connector> GetAllConnectors();
    }
}
