using GreenFlux.SmartCharging.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace GreenFlux.SmartCharging.Domain.Repositories
{
    public interface IChargeStationRepository
    {
        void CreateChargeStation(ChargeStation chargeStation);
        ChargeStation GetChargeStationById(long chargeStationId);
        List<ChargeStation> GetChargeStationListByGroupId(long groupId);
        void DeleteChargeStation(ChargeStation chargeStation);
        void UpdateChargeStation(ChargeStation chargeStation);
        List<ChargeStation> GetAllChargeStations();
    }
}
