namespace OneFitnessVue.ViewModel.Usermaster
{
    public class CommonUserDetailsViewModel
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string MobileNo { get; set; }
        public int RoleId { get; set; }
        public string RoleName { get; set; }
        public bool Status { get; set; }
        public string PasswordHash { get; set; }
    }
}