using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestProject
{
    public partial class SharedTests
    {
        public string ExpectedOutput {  get { return @"Round Score: 8
Round Score: 1
Round Score: 6
Total Score: 15".ToLower();  
            } 
        }
        public int FinalScore {  get { return 15;  } }
    }
}
