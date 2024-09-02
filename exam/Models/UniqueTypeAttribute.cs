using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace exam.Models
{
    public class UniqueTypeAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var db = new RecyclingDBEntities();
            var recyclableType = value as string;

            // Check if the type already exists in the database
            if (db.RecyclableTypes.Any(r => r.Type == recyclableType))
            {
                return new ValidationResult("This type already exists. Please enter a unique type.");
            }

            return ValidationResult.Success;
        }
    }
}