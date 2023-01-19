using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ObjectOrientedConsoleApp
{
    public abstract class AbstractShape
    {
        public AbstractShape(string name)
        {
            Name = name ?? throw new ArgumentNullException(nameof(name));
        }

        public string Name { get; private set; }
        public abstract int Score { get; }
        public abstract Char OppCode { get; }
        public abstract Char PlayerCode { get; }
        public abstract Char WinsAgainst { get; }

        internal bool WinsTo(AbstractShape opponentShape)
        {
            return this.WinsAgainst == opponentShape.OppCode;
        }

        internal bool LosesTo(AbstractShape opponentShape)
        {
            return opponentShape.WinsAgainst == this.OppCode;
        }
    }
}
