//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Api.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ApplicationClient
    {
        public string Id { get; set; }
        public string Secret { get; set; }
        public string Name { get; set; }
        public int ApplicationType { get; set; }
        public bool Active { get; set; }
        public int RefreshTokenLifeTime { get; set; }
        public string AllowedOrigin { get; set; }
    }
}
