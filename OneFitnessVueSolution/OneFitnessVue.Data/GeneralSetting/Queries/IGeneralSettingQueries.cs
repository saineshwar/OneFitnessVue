using System.Linq;
using OneFitnessVue.Model.GeneralSetting;
using OneFitnessVue.ViewModel.MemberRegistration;

namespace OneFitnessVue.Data.GeneralSetting.Queries
{
    public interface IGeneralSettingQueries
    {
        GeneralSettingsModel GetActiveGeneralSettings();
        RecepitDetailsViewModel GetRecepitDetails(string memberId, string paymentId);
    }
}