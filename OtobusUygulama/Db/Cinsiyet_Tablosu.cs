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
    
    public partial class Cinsiyet_Tablosu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cinsiyet_Tablosu()
        {
            this.SeferBilgisi_Tablosu = new HashSet<SeferBilgisi_Tablosu>();
        }
    
        public int CinsiyetID { get; set; }
        public string Cinsiyet { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SeferBilgisi_Tablosu> SeferBilgisi_Tablosu { get; set; }
    }
}
