using GreenFlux.SmartCharging.Domain.Entities.Mediator.Base;
using GreenFlux.SmartCharging.Domain.Validation;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartCharging.API.Application.Mediator.Base
{
    public abstract class AbstractRequesHandler<T> : IRequestHandler<T, Response>
        where T : IRequest<Response>
    {
        internal abstract HandleResponse HandleIt(T request, CancellationToken cancellationToken);

        public Task<Response> Handle(T request, CancellationToken cancellationToken)
        {
            var response = new Response();

            if (object.Equals(request, default(T)))
                return Task.FromResult(response);

            try
            {
                var result = HandleIt(request, cancellationToken);
                ParseResult(response, result);
            }
            catch (RestException re)
            {
                response.ErrorMessage = re.Message;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                // Deal with logs, errors and so on
                // Can also implement other custom error handlers
            }

            return Task.FromResult(response);
        }

        private void ParseResult(Response response, HandleResponse result)
        {
            if (result != null && result?.ErrorMessage == null)
                response.Content = result.Content;
            else if (result != null && result?.ErrorMessage != null)
                response.ErrorMessage = result.ErrorMessage;
        }
    }

    internal class HandleResponse
    {
        public object Content { get; set; }
        public string ErrorMessage { get; set; }
    }
}
