using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TWOLAT.RPS.Lib
{
    public class Scissors : AbstractShape
    {
        public Scissors() :
            base("Scissors", 'Z', 'C', 'B', 3)
        {
        }
    }
}

