//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OtobusUygulama.Db
{
    using System;
    using System.Collections.Generic;
    
    public partial class OtobusBilgi_Tablosu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OtobusBilgi_Tablosu()
        {
            this.GünlükRapor = new HashSet<GünlükRapor>();
            this.OtobusKoltukDuzeni_Tablosu = new HashSet<OtobusKoltukDuzeni_Tablosu>();
        }
    
        public int OtobusID { get; set; }
        public string OtobusModel { get; set; }
        public string OtobusPlaka { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GünlükRapor> GünlükRapor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OtobusKoltukDuzeni_Tablosu> OtobusKoltukDuzeni_Tablosu { get; set; }
    }
}
