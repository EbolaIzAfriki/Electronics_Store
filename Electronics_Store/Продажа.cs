//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Electronics_Store
{
    using System;
    using System.Collections.Generic;
    
    public partial class Продажа
    {
        public int id { get; set; }
        public int idUser { get; set; }
        public int idTovar { get; set; }
        public System.DateTime date { get; set; }
        public int countProd { get; set; }
    
        public virtual Пользователь Пользователь { get; set; }
        public virtual Товар Товар { get; set; }
    }
}
