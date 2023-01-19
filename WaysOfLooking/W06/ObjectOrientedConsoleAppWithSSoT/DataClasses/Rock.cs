using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TWOLAT.RPS.Lib
{
    public class Rock : AbstractShape
    {
        public Rock() :
            base("Rock", 'X', 'A', 'C', 1)
        {
        }
    }
}

