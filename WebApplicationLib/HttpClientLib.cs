using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace WebApplicationLib
{
    public class HttpClientLib
    {
        public async Task<T> GetAsync<T>(string appSetting, string apiController)
        {
            HttpClient client = new HttpClient();
            var urlAppSetting = SettingLib.GetAppSetting(appSetting);
            HttpResponseMessage response = await client.GetAsync(urlAppSetting + apiController);
            if (response.IsSuccessStatusCode)
            {
                return await response.Content.ReadAsAsync<T>();
            }
            return await Task.FromResult(default(T));
        }
    }
}
