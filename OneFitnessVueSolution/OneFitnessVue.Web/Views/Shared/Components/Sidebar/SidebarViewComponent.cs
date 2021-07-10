using Microsoft.AspNetCore.Mvc;

namespace OneFitnessVue.Web.Views.Shared.Components.Sidebar
{
    public class SidebarViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke() => View();
    }
}