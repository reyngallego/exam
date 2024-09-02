namespace exam.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class RecyclableType
    {
        public RecyclableType()
        {
            this.RecyclableItems = new HashSet<RecyclableItem>();
        }

        public int Id { get; set; }

        [Required]
        [UniqueType] // Custom validation attribute to check for uniqueness
        public string Type { get; set; }

        public decimal Rate { get; set; }
        public decimal MinKg { get; set; }
        public decimal MaxKg { get; set; }

        public virtual ICollection<RecyclableItem> RecyclableItems { get; set; }
    }
}
