using System.ComponentModel.DataAnnotations.Schema;

[Table("tasks")]
public class TasksList
{
    public int Id { get; set; }
    
    public string task_name { get; set; }
    
    public Status _Status { get; set; } = Status.NotStarted;
    
    public string description { get; set; }

    [ForeignKey("user_id")]
    public int userId { get; set; }

}

