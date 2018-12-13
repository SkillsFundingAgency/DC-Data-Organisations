using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.DependencyInjection;

namespace ESFA.DC.ReferenceData.Organisations.Console.Core.DesignTime
{
    public class ReferenceDataDesignTimeServices : IDesignTimeServices
    {
        public void ConfigureDesignTimeServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddSingleton<IPluralizer, ReferenceDataPluralizer>();
        }
    }
}
