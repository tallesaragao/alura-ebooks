using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Helpers
{
    public class FileHelper
    {
        public static string Save(string basePath, string fileName, Stream file)
        {
            string name = Guid.NewGuid().ToString() + Path.GetExtension(fileName);
            var realPath = Path.Combine(basePath, name);
            using (var fileStream = File.Create(realPath))
            {
                file.CopyTo(fileStream);
            }
            return realPath;
        }

        public static void Remove(string filePath)
        {
            File.Delete(filePath);
        }

        internal static string Save(string basePath, object arquivo)
        {
            throw new NotImplementedException();
        }
    }
}
