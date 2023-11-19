using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP2
{

    public class Archivo
    {
        public string Name { get; set; }
        public string Path{ get; set; }
        public Archivo(string Name, string Path) 
        {
            this.Name = Name;
            this.Path = Path;
        }
    }
}