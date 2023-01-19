using System;
using System.ComponentModel;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using CoreLibrary.Extensions;

namespace TWOLAT.RPS.Lib
{                            
    public partial class Rule
    {
        private void InitPoco()
        {
            
            
                this.Rules_Shapes = new BindingList<Shape>();
            
                this.Rules_Outcomes = new BindingList<Outcome>();
            
                this.Rules_Games = new BindingList<Game>();
            

        }
        
        partial void AfterGet();
        partial void BeforeInsert();
        partial void AfterInsert();
        partial void BeforeUpdate();
        partial void AfterUpdate();

        

        
        [JsonProperty(DefaultValueHandling = DefaultValueHandling.IgnoreAndPopulate, PropertyName = "RuleId")]
        public Int32 RuleId { get; set; }
    

        
        [JsonProperty(DefaultValueHandling = DefaultValueHandling.IgnoreAndPopulate, PropertyName = "Rules_Shapes")]
        public BindingList<Shape> Rules_Shapes { get; set; }
            
        [JsonProperty(DefaultValueHandling = DefaultValueHandling.IgnoreAndPopulate, PropertyName = "Rules_Outcomes")]
        public BindingList<Outcome> Rules_Outcomes { get; set; }
            
        [JsonProperty(DefaultValueHandling = DefaultValueHandling.IgnoreAndPopulate, PropertyName = "Rules_Games")]
        public BindingList<Game> Rules_Games { get; set; }
            

        
        
        private static string CreateRuleWhere(IEnumerable<Rule> rules, String forignKeyFieldName = "RuleId")
        {
            if (!rules.Any()) return "1=1";
            else 
            {
                var idList = rules.Select(selectRule => String.Format("'{0}'", selectRule.RuleId));
                var csIdList = String.Join(",", idList);
                return String.Format("{0} in ({1})", forignKeyFieldName, csIdList);
            }
        }
        
    }
}
