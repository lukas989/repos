using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

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

        public async Task<T> GetByIdAsync<T>(string appSetting, string apiController, int id)
        {
            HttpClient client = new HttpClient();
            var urlAppSetting = SettingLib.GetAppSetting(appSetting);
            HttpResponseMessage response = await client.GetAsync(urlAppSetting + apiController + id.ToString());
            if (response.IsSuccessStatusCode)
            {
                return await response.Content.ReadAsAsync<T>();
            }
            return await Task.FromResult(default(T));
        }

        public async Task PostAsync<T>(string appSetting, string apiController, T data)
        {
            HttpClient client = new HttpClient();
            var urlAppSetting = SettingLib.GetAppSetting(appSetting);

            var myContent = JsonConvert.SerializeObject(data);
            var buffer = System.Text.Encoding.UTF8.GetBytes(myContent);
            var byteContent = new ByteArrayContent(buffer);
            byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            await client.PostAsync(urlAppSetting + apiController, byteContent);
        }

        public async Task PutAsync<T>(string appSetting, string apiController, T data)
        {
            HttpClient client = new HttpClient();
            var urlAppSetting = SettingLib.GetAppSetting(appSetting);

            var myContent = JsonConvert.SerializeObject(data);
            var buffer = System.Text.Encoding.UTF8.GetBytes(myContent);
            var byteContent = new ByteArrayContent(buffer);
            byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            await client.PutAsync(urlAppSetting + apiController, byteContent);
        }
    }
}
