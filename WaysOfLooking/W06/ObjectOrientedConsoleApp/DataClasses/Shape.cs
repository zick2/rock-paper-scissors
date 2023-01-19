using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ObjectOrientedConsoleApp
{
    public abstract class Shape : AbstractShape
    {
        protected Shape(string name) : base(name)
        {
        }
    }
}
