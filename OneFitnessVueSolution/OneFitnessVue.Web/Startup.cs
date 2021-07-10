using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DNTCaptcha.Core;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using OneFitnessVue.Common;
using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Extensions;

namespace OneFitnessVue.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddServicesCommand(Configuration);

            services.AddServicesQueries(Configuration);

            services.AddAutoMapper(typeof(Startup).Assembly);

            var connection = Configuration.GetConnectionString("DatabaseConnection");

            services.AddDbContext<OneFitnessVueContext>(options => options.UseSqlServer(connection));
     
            services.Configure<ConnectionStrings>(Configuration.GetSection("ConnectionStrings"));

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();


            services.AddMvc()
                .AddNewtonsoftJson(options =>
                {
                    options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
                    options.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
                    options.SerializerSettings.ContractResolver =
                        new Newtonsoft.Json.Serialization.DefaultContractResolver();
                })
                .AddSessionStateTempDataProvider();

            // For FileUpload
            services.Configure<FormOptions>(x =>
            {
                x.ValueLengthLimit = int.MaxValue;
                x.MultipartBodyLengthLimit = int.MaxValue; // In case of multipart
                x.ValueLengthLimit = int.MaxValue; //not recommended value
                x.MemoryBufferThreshold = Int32.MaxValue;
            });

            // For Setting Session Timeout
            services.AddSession(options =>
            {
                // Set a short timeout for easy testing.
                options.IdleTimeout = TimeSpan.FromHours(1);
                options.Cookie.HttpOnly = true;
                // Make the session cookie essential
                options.Cookie.IsEssential = true;
                options.Cookie.SameSite = SameSiteMode.None;
            });


            //  Cookie
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.HttpOnly = Microsoft.AspNetCore.CookiePolicy.HttpOnlyPolicy.Always;
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
                options.Secure = CookieSecurePolicy.Always;
                options.OnAppendCookie = (context) =>
                {
                    context.IssueCookie = true;
                };
         
            });


            services.AddControllersWithViews().AddRazorRuntimeCompilation();
            services.AddControllers();

            // using Memory Cache 
            services.AddMemoryCache();

            #region Registering AddDNTCaptcha
          
            //  AddDNTCaptcha
            services.AddDNTCaptcha(options =>
              
                options.UseCookieStorageProvider()
                    .ShowThousandsSeparators(false)
                    .WithEncryptionKey("9F3baE2KFTM7m0C^tt%^Ag")
                    
            );
            #endregion
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseStatusCodePagesWithReExecute("/error/{0}");
              
                app.UseHsts();
            }
            app.UseHttpsRedirection();

            app.UseStaticFiles();
          
            app.UseRouting();

            app.UseAuthorization();

            app.UseCookiePolicy();
            // Enabling Session
            app.UseSession();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute("areas", "{area:exists}/{controller=Home}/{action=Index}/{id?}");

                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Portal}/{action=Login}/{id?}");
            });
        }
    }
}
