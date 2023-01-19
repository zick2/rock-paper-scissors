using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TWOLAT.RPS.Lib
{
    public class Paper : AbstractShape
    {
        public Paper() :
            base("Paper", 'Y', 'B', 'A', 2)
        {
        }
    }
}

