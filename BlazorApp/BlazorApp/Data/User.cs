using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;
using BlazorApp.Components.Pages;

[Table("users")]
public class User
{
    public int id { get; set; }
    public string first_name { get; set; }
    public string last_name { get; set; }
    public string email { get; set; }
    public string password { get; set; }
    public int role { get; set; }
}