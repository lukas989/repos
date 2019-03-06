using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace WebApplicationLib
{
    public class ObjectLib
    {
        public T InitObjec<T>(T objectValues, string login)
        {
            SetReflectionProperty(objectValues, "LastUpdate", DateTime.Now);
            SetReflectionProperty(objectValues, "EntryDate", DateTime.Now);
            SetReflectionProperty(objectValues, "LastAuthor", login);
            SetReflectionProperty(objectValues, "EntryAuthor", login);

            return objectValues;
        }

        public T UpdateObject<T>(T objectValues, string login)
        {
            SetReflectionProperty(objectValues, "LastUpdate", DateTime.Now);
            SetReflectionProperty(objectValues, "LastAuthor", login);
            return objectValues;
        }
        private void SetReflectionProperty<T>(T objectValues, string propertyName, object propertValue)
        {
            PropertyInfo prop = objectValues.GetType().GetProperty(propertyName, BindingFlags.Public | BindingFlags.Instance);
            if (null != prop && prop.CanWrite)
            {
                prop.SetValue(objectValues, propertValue, null);
            }

        }


    }
}
