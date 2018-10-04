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
        public static string Save(string basePath, IFormFile file)
        {
            string name = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
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
    }
}
