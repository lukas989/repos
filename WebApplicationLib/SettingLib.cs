using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace Lib
{
    public static class SettingLib
    {
        public static string GetAppSetting(string value)
        {
            return System.Configuration.ConfigurationManager.AppSettings[value];
        }
    }
}
