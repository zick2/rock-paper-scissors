using System;
            
namespace CoreLibrary.Extensions 
{
    public static partial class CoreLibraryExtensions {
        public static String SafeToString(this object obj) 
        {
            if (ReferenceEquals(obj, null)) return String.Empty;
            else return obj.ToString();
        }

        public static int ToInt(this byte? byteValue)
        {
            if (byteValue.HasValue) return byteValue.Value;
            else return 0;
        }

        public static int ToInt(this int? intValue)
        {
            if (intValue.HasValue) return intValue.Value;
            else return 0;
        }

        public static int ToInt(this object obj)
        {
            if (obj is null) return 0;
            else return (Int32)obj;
        }
    }
}