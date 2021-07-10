using DNTCaptcha.Core;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OneFitnessVue.Common;
using OneFitnessVue.Data.UserMaster.Queries;
using OneFitnessVue.Services.Messages;
using OneFitnessVue.ViewModel.Login;
using OneFitnessVue.ViewModel.Messages;
using OneFitnessVue.ViewModel.Usermaster;
using System;
using System.Security.Cryptography;
using System.Text;

namespace OneFitnessVue.Web.Controllers
{
    public class PortalController : Controller
    {
        private readonly IUserMasterQueries _userMasterQueries;
        private readonly IEmailSender _emailSender;
        private readonly IHttpContextAccessor _httpContextAccessor;
       
      
        private readonly IDNTCaptchaValidatorService _validatorService;
        public PortalController(IUserMasterQueries userMasterQueries, IEmailSender emailSender, 
            IHttpContextAccessor httpContextAccessor, 
            IDNTCaptchaValidatorService validatorService)
        {
            _userMasterQueries = userMasterQueries;
            _emailSender = emailSender;

            _httpContextAccessor = httpContextAccessor;
            _validatorService = validatorService;
        }

        [HttpGet]
        public IActionResult Login()
        {
            var token = RandomUniqueToken.Value();
            LoginViewModel loginView = new LoginViewModel()
            {
                Hdrandomtoken = token
            };

            HttpContext.Session.SetString("Hdrandomtoken", token);
            return View(loginView);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Login(LoginViewModel loginViewModel)
        {
            var token = RandomUniqueToken.Value();

            if (ModelState.IsValid)
            {
                if (!_validatorService.HasRequestValidCaptchaEntry(Language.English, DisplayMode.ShowDigits))
                {
                    TempData["LoginErrorMessage"] = "Please enter valid security code";
                    return RedirectToAction("Login");
                }


                if (!_userMasterQueries.CheckUsernameExists(loginViewModel.Username))
                {
                    TempData["LoginErrorMessage"] = "Entered Username or Password is Invalid";
                    return RedirectToAction("Login");
                }
                else
                {
                    var loggedInuserdetails = _userMasterQueries.GetCommonUserDetailsbyUserName(loginViewModel.Username);

                    if (loggedInuserdetails == null)
                    {
                        TempData["LoginErrorMessage"] = "Entered Username or Password is Invalid";
                        return RedirectToAction("Login");
                    }

                    if (loggedInuserdetails.Status == false)
                    {
                        TempData["LoginErrorMessage"] = "Your Account is InActive Contact Administrator";
                        return RedirectToAction("Login");
                    }

                   
                    var hiddentoken = HttpContext.Session.GetString("Hdrandomtoken");
                 
                    if (ConcateTokenandPassword(loggedInuserdetails.PasswordHash, hiddentoken) == loginViewModel.Password)
                    {
                        SetAuthenticationCookie();
                        SetApplicationSession(loggedInuserdetails);

                        switch (loggedInuserdetails.RoleId)
                        {
                            case 2:
                                return RedirectToAction("Dashboard", "Dashboard", new { Area = "Service" });
                        }

                    }
                    else
                    {
                        TempData["LoginErrorMessage"] = "Entered Username or Password is Invalid";
                        return RedirectToAction("Login");
                    }


                }
            }

            loginViewModel.Hdrandomtoken = token;
            HttpContext.Session.SetString("Hdrandomtoken", token);
            return View(loginViewModel);
        }


        [HttpGet]
        public IActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateDNTCaptcha(ErrorMessage = "Please enter valid security code", CaptchaGeneratorLanguage = Language.English, CaptchaGeneratorDisplayMode = DisplayMode.ShowDigits)]
        public IActionResult ForgotPassword(ForgotPasswordViewModel forgotPasswordViewModel)
        {
            if (!_userMasterQueries.CheckUsernameExists(forgotPasswordViewModel.UserName))
            {
                ModelState.AddModelError("", "Entered Username or Password is Invalid");
            }
            else
            {
                var userdetails = _userMasterQueries.GetUserByUsername(forgotPasswordViewModel.UserName);
                var token = HashHelper.CreateHashSHA256((GenerateRandomNumbers.GenerateRandomDigitCode(6)));
                var body = _emailSender.CreateVerificationEmail(userdetails, token);
                //_verificationCommand.SendResetVerificationToken(userdetails.UserId, token);

                MessageTemplate messageTemplate = new MessageTemplate()
                {
                    ToAddress = userdetails.EmailId,
                    Subject = "Welcome to OneFitnessVue",
                    Body = body
                };

                _emailSender.SendMailusingSmtp(messageTemplate);

                TempData["ForgotPasswordMessage"] = "An email has been sent to the address you have registered." +
                                                    "Please follow the link in the email to complete your password reset request";

                return RedirectToAction("ForgotPassword", "Portal");
            }

            return View();
        }


        [HttpPost]
        public IActionResult Logout()
        {
            try
            {
          
                CookieOptions option = new CookieOptions();

                if (Request.Cookies[AllSessionKeys.AuthenticationToken] != null)
                {
                    option.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Append(AllSessionKeys.AuthenticationToken, "", option);
                }

                HttpContext.Session.Clear();
                
                return RedirectToAction("Login", "Portal");
            }
            catch (Exception)
            {
                throw;
            }

        }

        private void SetAuthenticationCookie()
        {
            string strAuthToken = Guid.NewGuid().ToString();
            HttpContext.Session.SetString(AllSessionKeys.AuthenticationToken, strAuthToken);
            Response.Cookies.Append(AllSessionKeys.AuthenticationToken, strAuthToken);
        }

        private void SetApplicationSession(CommonUserDetailsViewModel commonUser)
        {
            HttpContext.Session.SetInt32(AllSessionKeys.RoleId, commonUser.RoleId);
            HttpContext.Session.SetInt32(AllSessionKeys.UserId, Convert.ToInt32(commonUser.UserId));
            HttpContext.Session.SetString(AllSessionKeys.UserName, Convert.ToString(commonUser.UserName));
            HttpContext.Session.SetString(AllSessionKeys.RoleIdString, Convert.ToString(commonUser.RoleId));
            HttpContext.Session.SetString(AllSessionKeys.RoleName, Convert.ToString(commonUser.RoleName));
            if (commonUser.FirstName != null)
                HttpContext.Session.SetString(AllSessionKeys.FirstName, Convert.ToString(commonUser.FirstName));

            HttpContext.Session.SetString(AllSessionKeys.EmailId, Convert.ToString(commonUser.EmailId));
            HttpContext.Session.SetString(AllSessionKeys.MobileNo, Convert.ToString(commonUser.MobileNo));
        
        }

        [NonAction]
        private string ConcateTokenandPassword(string storedDatabasePassword, string hiddenrandomtoken)
        {
            try
            {
                return ComputeSha256Hash(hiddenrandomtoken + storedDatabasePassword);
            }
            catch (Exception)
            {
                throw;
            }
        }
        private static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                foreach (var t in bytes)
                {
                    builder.Append(t.ToString("x2"));
                }
                return builder.ToString();
            }
        }

      
    }
}
